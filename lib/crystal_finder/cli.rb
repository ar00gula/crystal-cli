class CLI
    def initialize
        puts ""
        sleep(1)
        puts "" 
        puts "Grabbing data! Please be paitent."
        Scraper.new.first_scrape
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
        puts "                      " + ("-".magenta + "-".light_magenta)*17
        puts ""
        puts "                      c r y s t a l  p r o p e r t i e s"
        puts ""
        puts "                      " + ("-".magenta + "-".light_magenta)*17
        puts ""
        @first_list = Meaning.list_all.each_with_index{|meaning, index| puts "#{index + 1}. #{meaning}"}
        @first_list
        puts ""
        puts ""
        puts "Please choose your meaning category (enter number)!"
        input = gets.chomp
        puts ""

        input_corrector(input, @first_list)
        find_associated_crystals(@corrected_input)
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
        puts ""

        input_corrector(input, @sorted_crystal_list)
        find_crystal_description(@corrected_input)
    end

    def find_crystal_description(input)
        sleep(1)
        puts ""        
        crystal = Crystal.all.find{|crystal| crystal if crystal.name == @sorted_crystal_list[input.to_i - 1]}
        Scraper.new.second_scrape(crystal)
        puts ""
        puts ""
        spaces = " "*(39 - (crystal.name.split("").length)) #make this into a method
        array = ["-".magenta + "-".light_magenta]
        array_2 = array*(crystal.name.split("").length)
        divider_line = array_2.join
        puts spaces + divider_line
        puts "#{spaces}  " + crystal.name.downcase.split("").join(" ")
        puts spaces + divider_line
        puts ""
        puts " "*(39-(crystal.specific_meanings.length/2)) + crystal.specific_meanings.downcase
        puts ""
        puts ""
        puts crystal.description
        puts ""
        puts ""
        puts ""
        puts "                             " + ("-".magenta + "-".light_magenta)*10 + "-".magenta
        puts "                             associated categories"
        puts "                             " + ("-".magenta + "-".light_magenta)*10 + "-".magenta
        puts ""
        puts crystal.meaning_category.map {|meaning| meaning.name}.sort.join(", ")
        puts ""
        puts ""
        puts "1. Return to Menu"
        puts "2. Exit"
        puts ""
        puts ""
        input = gets.chomp
        puts ""
        input_corrector(input, [1, 2])

        if @corrected_input == "1"
            sleep(1)
            puts ""
            print_menu
        elsif @corrected_input == "2"
            puts ""
            puts "Goodbye!"
        end
    end
    
    def input_corrector(input, list)
        if input.to_i > 0 && input.to_i <= list.length
            @corrected_input = input
        else 
            puts "Input invalid. Try a better number!"
            new_input = gets.chomp
            puts ""
            until new_input.to_i <= list.length && new_input.to_i > 0
                puts "Input invalid. Try a better number!"
                new_input = gets.chomp
                puts ""
            end
            @corrected_input = new_input
        end
    end

end