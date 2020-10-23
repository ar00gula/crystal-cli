class CLI
    
    def run

    puts "Welcome to crystal finder!"
    sleep(1)
    puts "Grabbing data! Please be paitent."
    @scraper = Scraper.new
    @scraper.first_scrape
    puts "Thank you!"
    sleep(1)
    puts "What properites are you looking for?"
    @first_list = Meaning.list_all.each_with_index{|meaning, index| puts "#{index + 1}. #{meaning}"}
    @first_list
    puts "Please choose your meaning category (enter number)!"
    input = gets.chomp
    find_associated_crystals(input)

    # meaning_category = Meaning.all.find{|meaning| meaning if meaning.name == first_list[input.to_i-1]}
    # @scraper.second_scrape(meaning_category)
    # @sorted_crystal_list = meaning_category.associated_crystals.map {|crystal| crystal.name}.sort.each_with_index {|crystal, index| puts "#{index + 1}. #{crystal}"}
    puts ""
    puts ""
    puts "Select crystal for more information! (enter number)"
    input_2 = gets.chomp
    find_crystal_description(input_2)
    # crystal = Crystal.all.find{|crystal| crystal if crystal.name == sorted_crystal_list[input_2.to_i - 1]}
    # scraper.third_scrape(crystal)
    # puts crystal.description

    puts "1. Return to Menu"
    puts "2. "
    end

    def find_associated_crystals(input)
        meaning_category = Meaning.all.find{|meaning| meaning if meaning.name == @first_list[input.to_i-1]}
    @scraper.second_scrape(meaning_category)
    @sorted_crystal_list = meaning_category.associated_crystals.map {|crystal| crystal.name}.sort.each_with_index {|crystal, index| puts "#{index + 1}. #{crystal}"}
   
    end


    def find_crystal_description(input)
        crystal = Crystal.all.find{|crystal| crystal if crystal.name == @sorted_crystal_list[input.to_i - 1]}
        @scraper.third_scrape(crystal)
        
        puts crystal.description
    end
    

   
    

    # def browse_by_meaning





    #     def browse_by_crystal
    #         puts ""
    #         puts "Crystals in Database"
    #         puts ""
    #         crystal_list = Crystal.list_crystals
    #         crystal_list
    #         puts "Please select your crystal (enter number)!"
    #         chosen_crystal = crystal_list[gets.chomp.to_i - 1]
    #         sleep(1)
    #         Crystal.print_crystal_information(chosen_crystal)
    #             #how do i loop here
    #         puts "1. Return to Menu"
    #         puts "2. Exit"
    #         new_input = gets.chomp
            
    #         if new_input == "1"
    #             browse_by_crystal
    #         elsif new_input == "2"
    #             puts "Goodbye!"
    #         end
    #     end
end