class CLI
    def initialize
        puts ""
        sleep(1)
        puts "" 
        puts "Grabbing data! Please be paitent."
        @scraper = Scraper.new
        @scraper.first_scrape
        puts "Thank you!"
        puts ""
        sleep(2)

        puts ""
        puts "                _    .  ,   .           . "
        sleep(0.2)
        puts "                *  / \\_ *  / \\_      _  *        *   /\\'__        *"
        sleep(0.2)
        puts "                  /    \\  /    \\,   ((        .    _/  /  \\  *'."
        sleep(0.2)
        puts "             .   /\\/\\  /\\/ :' __ \\_  `          _^/  ^/    `--."
        sleep(0.2)
        puts "                /    \\/  \\  _/  \\-'\\      *    /.' ^_   \\_   .'\\  * "
        sleep(0.2)
        puts "              /  .-   `. \\/     \\ /==~=-=~=-=-;.  _/ \\ -. `_/   \\"
        sleep(0.2)
        puts "             /  `-.__ ^   / .-'.--\\ =-=~_=-=~=^/  _ `--./ .-'  `-"
        sleep(0.2)
        puts "            /jgs     `.  / /       `.~-^=-=~=^=.-'      '-._ `._"
        puts ""
        sleep(1)
        puts "                                     _     _                             "
        puts "                                    | |   | | o             |            "
        puts "       __   ,_          , _|_  __,  | |   | |     _  _    __|   _   ,_   "
        puts "      /    /  |  |   | / \\_|  /  |  |/    |/  |  / |/ |  /  |  |/  /  |  "
        puts "      \\___/   |_/ \\_/|/ \\/ |_/\\_/|_/|__/  |__/|_/  |  |_/\\_/|_/|__/   |_/"
        puts "                    /|                    |\\                             "
        puts "                    \\|                    |/                          "
    end


    def run
        sleep(1)
        print_menu
    end

    def print_menu
        puts ""
        puts ""
        puts "                      -".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta
        puts ""
        puts "                      c r y s t a l  p r o p e r t i e s"
        puts ""
        puts "                      -".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta
        puts ""
        @first_list = Meaning.list_all.each_with_index{|meaning, index| puts "#{index + 1}. #{meaning}"}
        @first_list
        puts ""
        puts ""
        puts "Please choose your meaning category (enter number)!"
        input = gets.chomp
        puts ""
        puts ""
    
        if input.to_i == 0
            puts "Input invalid. Try a better number!"
            input = gets.chomp
            puts ""
            until input.to_i <= @first_list.length && input.to_i != 0
                puts "Input invalid. Try a better number!"
                puts ""
                input = gets.chomp
            end
        end

        find_associated_crystals(input)

    end

    def find_associated_crystals(input)
        sleep(1)
        puts "" 
        meaning_category = Meaning.all.find{|meaning| meaning if meaning.name == @first_list[input.to_i-1]}
        @sorted_crystal_list = meaning_category.associated_crystals.map {|crystal| crystal.name}.sort.each_with_index {|crystal, index| puts "#{index + 1}. #{crystal}"}
        puts ""
        puts ""
        puts "Select crystal for more information! (enter number)"

        input = gets.chomp
        if input.to_i == 0
            puts "Input invalid. Try a better number!"
            input = gets.chomp
            puts ""
            until input.to_i <= @first_list.length && input.to_i != 0
                puts "Input invalid. Try a better number!"
                puts ""
                input = gets.chomp
                puts ""
            end
        end
        find_crystal_description(input)
   
    end

    def find_crystal_description(input)
        sleep(1)
        puts ""        
        crystal = Crystal.all.find{|crystal| crystal if crystal.name == @sorted_crystal_list[input.to_i - 1]}
        Scraper.new.second_scrape(crystal)
        puts ""
        puts ""
        # spaces = 39 - (crystal.name.split("").length)
        # space = " "
        spaces = " "*(39 - (crystal.name.split("").length))
        array = ["-".magenta + "-".light_magenta]
        array_2 = array*(crystal.name.split("").length)
        array_2 = array_2.join
        puts spaces + array_2
        puts "#{spaces}  " + crystal.name.downcase.split("").join(" ")
        puts spaces + array_2
        puts ""
        puts " "*(39-(crystal.specific_meanings.length/2)) + crystal.specific_meanings.downcase
        puts ""
        puts ""
        puts crystal.description
        puts ""
        puts ""
        puts ""
        puts "                             -".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta
        puts "                             associated categories"
        puts "                             -".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta + "-".light_magenta + "-".magenta
        puts ""
        puts crystal.meaning_category.map {|meaning| meaning.name}.uniq.sort.join(", ")
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