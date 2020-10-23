class CLI
    

    def initialize

        puts "Welcome to crystal finder!"
        sleep(1)
        puts "Grabbing data! Please be paitent."
        @scraper = Scraper.new
        @scraper.first_scrape
        puts "Thank you!"
        sleep(1)

    end

    def run
        # "1. Browse by meaning"
        # "2. Browse by crystal"
        print_menu
    end

    # def browse_by_crystal
    #     puts "Input first letter of crystal"
    #     gets.chomp
    #     if gets.chomp == "A" || "a"
    #     end
    # end



    def print_menu
        puts "What properites are you looking for?"
        @first_list = Meaning.list_all.each_with_index{|meaning, index| puts "#{index + 1}. #{meaning}"}
        @first_list
        puts ""
        puts ""
        puts "Please choose your meaning category (enter number)!"
        puts ""
        input = gets.chomp
        until input.to_i < @first_list.length
            puts "Input invalid. Try a better number!"
            puts ""
            input = gets.chomp
        end

        find_associated_crystals(input)


    end

    def find_associated_crystals(input)
        meaning_category = Meaning.all.find{|meaning| meaning if meaning.name == @first_list[input.to_i-1]}
        @scraper.second_scrape(meaning_category)
        @sorted_crystal_list = meaning_category.associated_crystals.map {|crystal| crystal.name}.sort.each_with_index {|crystal, index| puts "#{index + 1}. #{crystal}"}
        puts ""
        input = gets.chomp
        until input.to_i < @sorted_crystal_list.length
            puts "Input invalid. Try a better number!"
            puts ""
            input = gets.chomp
        end
        find_crystal_description(input)
   
    end


    def find_crystal_description(input)

        puts ""
        puts ""
        puts "Select crystal for more information! (enter number)"
        
        crystal = Crystal.all.find{|crystal| crystal if crystal.name == @sorted_crystal_list[input.to_i - 1]}
        @scraper.third_scrape(crystal)
        puts ""
        puts ""
        puts crystal.name
        puts ""
        puts "-*-*-*-*-"
        puts ""
        puts crystal.specific_meanings
        puts ""
        puts "-*-*-*-*-"
        puts ""
        puts crystal.description
        puts ""
        puts ""
        puts "1. Return to Menu"
        puts "2. Exit"

        input = gets.chomp
        until input.to_i < 3
            puts "Input invalid. Try a better number!"
            puts ""
            input = gets.chomp
        end
        if input == "1"
            sleep(1)
            puts ""
            print_menu
        elsif input == "2"
            puts ""
            puts "Goodbye!"
        end

    end
    
end