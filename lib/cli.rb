class CLI
    def render_ascii_art
                line_num=0
        text=File.open('ascii.txt').read
        text.gsub!(/\r\n?/, "\n")
        text.each_line do |line|
        print "#{line_num += 1} #{line}"
        sleep(0.2)
        end
        sleep(1)
        text=File.open('ascii2.txt').read
        text.gsub!(/\r\n?/, "\n")
        text.each_line do |line|
        print "#{line_num += 1} #{line}"
        end

    end

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
        render_ascii_art

    end

    def run
        sleep(1)
        puts ""
        puts ""
        print_menu
    end

    def print_menu
        puts " ______________________________________"
        puts "|                                      |"
        puts "|  c r y s t a l  p r o p e r t i e s  |"
        puts "|______________________________________|"
        puts ""
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
                puts ""
            end
        end
        

        find_associated_crystals(input)


    end

    def find_associated_crystals(input)
        puts "" 
        meaning_category = Meaning.all.find{|meaning| meaning if meaning.name == @first_list[input.to_i-1]}
        Scraper.new.second_scrape(meaning_category)
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
        puts ""        
        crystal = Crystal.all.find{|crystal| crystal if crystal.name == @sorted_crystal_list[input.to_i - 1]}
        Scraper.new.third_scrape(crystal)
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