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
        array = "-"
        array_2 = array*(@name.split("").length*2)
        puts array_2
        puts ""
        puts @name.downcase.split("").join(" ")
        puts ""
        puts array_2
    end

    def associated_crystals
        print_meaning_category
        puts ""
        puts ""
        crystal_list = Crystal.all.select {|crystal| crystal.meaning_category.include?(self)}
    end

end