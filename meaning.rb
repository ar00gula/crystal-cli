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

    def self.all_list
        numbered_list = []
        @@all.sort.each_with_index {|meaning_cat, index| numbered_list << "#{index + 1}. #{meaning_cat}"
    end

    def print_meaning_category
        puts @name
    end

    def associated_crytals
        check_for_crystals
        print_meaning_category
        #this may not work??
        crystal_list = Crystals.all.find {|crystal| crystal.meaning_category == self}
        crystal_list.sort.each_with_index {|crystal, index| puts "#{index + 1}. #{crystal}"}
    end

end