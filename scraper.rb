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
            meaning_url = meaning_element.css('a')[1].attr('href')
        end
            meaning_category = Meaning.new(name, meaning_url)
    end


    def second_scrape#(meaning_category)
        meaning_html = open(@base_url + "/collections/grounding/tumbled-stones") #meaning_category.meaning_url + "/tumbled-stones")
        meaning_html_parsed_to_elements = Nokogiri::HTML(meaning_html)
        crystal_elements = meaning_html_parsed_to_elements.css('div.page-width').children.css('div.grid-view-item')
test_array = []
test_array_2 = []

        crystal_elements.each do |crystal_element|
            name = crystal_element.css('div.h4').text
            test_array << name
            crystal_url = crystal_element.css('a.grid-view-item__link').attr('href').value
            test_array_2 << crystal_url
        end
        binding.pry

    end

end
