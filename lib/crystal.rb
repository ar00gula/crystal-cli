class Crystal

    @@all = []

    attr_accessor :name, :crystal_url, :meaning_category, :description, :specific_meanings

    def initialize(name, crystal_url, meaning_category)
        @name = name
        @crystal_url = crystal_url
        @meaning_category = meaning_category
        
        unless
        name = @@all.find {|crystal| crystal.name == name}
        @@all << self
        end
    end

    def self.all
        @@all
    end

    def self.list_all
        binding.pry
    end

    def meanings
        Meaning.all.select {|meaning| meaning.associated_crystals.include?(self)}
    end

end