class Scraper
    def initialize
        @base_url = "https://crystalearthspirit.com"
    end

    def first_scrape
        html = open(@base_url + "/pages/crystals-by-meaning")
        html_parsed_to_elements = Nokogiri::HTML(html)
        meaning_elements = html_parsed_to_elements.css('div.grid-uniform').children.css('div.grid__item')
        meaning_elements.each do |meaning_element|
            name = meaning_element.css('a')[1].text
            meaning_category_url = meaning_element.css('a')[1].attr('href')
            meaning_category = Meaning.new(name, meaning_category_url)
        end

        Meaning.all.each do |meaning_category|
            meaning_html = open(@base_url + meaning_category.meaning_category_url + "/tumbled-stones")
            meaning_html_parsed_to_elements = Nokogiri::HTML(meaning_html)
            crystal_elements = meaning_html_parsed_to_elements.css('div.page-width').children.css('div.grid-view-item')
        
            crystal_elements.each do |crystal_element|
            
            name = crystal_element.css('div.h4').text.split("Tumbled")[0]
            crystal_url = crystal_element.css('a.grid-view-item__link').attr('href').value

                if Crystal.all.find {|crystal| crystal.name == name}
                    Crystal.all.each do |crystal|
                        if crystal.name == name && crystal.meaning_category.include?(meaning_category) == false
                        crystal.meaning_category << meaning_category
                        end
                    end
                else
                unless name == "Rhyolite (Australian) - Rainforest Jasper " || name == "Chevron Amethyst " || name == "Malachite " || name == "Lapis Laszuli "
                crystal = Crystal.new(name, crystal_url, meaning_category)
                end
            end
                
            end
        end
    end

    def second_scrape(crystal)
        description_html = open(@base_url + crystal.crystal_url)
        description_html_parsed_to_elements = Nokogiri::HTML(description_html)
        if crystal.name.include?("Amethyst") || crystal.name.include?("Mookaite")
            amethyst = description_html_parsed_to_elements.css('div.product-single__description').children.css('p').text
            amethyst_array = []
            amethyst.split(" ").each do |word|
                if word == word.upcase && word.length > 3
                    amethyst_array << word
                end
            end
            crystal.specific_meanings = amethyst_array.join(" & ")
            crystal.description = amethyst.split(amethyst_array.join(" & "))[1].split("Healing")[0].strip
        #add method that makes it not break if text is missing
        #create new method that has fewer edgecases
        else
            specific_meanings = description_html_parsed_to_elements.css('div.product-single__description').children.css('strong')[0].text
            crystal.specific_meanings = specific_meanings
            crystal.description = description_html_parsed_to_elements.css('div.product-single__description').text.split("#{specific_meanings}")[1].strip.split("Healing")[0]
        end
    end


end