class Crystal

    @@all = []

    attr_accessor :name, :crystal_url, :meaning_category, :description, :specific_meanings

    def initialize(name, crystal_url, meaning_category)
        @name = name
        @crystal_url = crystal_url
        @meaning_category = [meaning_category]
        
        # if name = @@all.find {|crystal| crystal.name == name}
        #     @@all.each do |crystal| 
        #         if crystal.name == name
        #             crystal.meaning_category = [crystal.meaning_category, meaning_category]
        #         end
        #     end
        # else
            @@all << self
        # end
    end

    def self.all
        @@all
    end

    def self.list_all
        @@all.map {|crystal| crystal.name}
    end

    def meanings
        Meaning.all.select {|meaning| meaning.associated_crystals.include?(self)}
    end

end