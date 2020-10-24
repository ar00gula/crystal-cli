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
        spaces = 39 - (@name.split("").length)
        space = " "
        spaces= space*spaces
    
        array = ["-".magenta + "-".light_magenta]
        array_2 = array*(@name.split("").length)
        pink_line = array_2.join
        puts spaces + pink_line
        puts ""
        puts spaces +@name.downcase.split("").join(" ")
        puts ""
        puts spaces + pink_line
    end

    def associated_crystals
        print_meaning_category
        puts ""
        puts ""
        crystal_list = Crystal.all.select {|crystal| crystal.meaning_category.include?(self)}
    end

end