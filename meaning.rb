class Meaning

    @@all = []

    attr_accessor :name, :meaning_category_url

    def initialize(name, meaning_category_url)
        @name = name
        @meaning_category_url = meaning_category_url
        @@all << self
    end


    def self.all
        @@all
    end

    def self.list_all
        @@all.collect{|meaning|meaning.name}.sort
    end

    def print_meaning_category
        puts @name
    end

    def associated_crystals
        print_meaning_category
        crystal_list = Crystal.all.select {|crystal| crystal.meaning_category == self}
    end

end