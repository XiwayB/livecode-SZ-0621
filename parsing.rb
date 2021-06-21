require 'open-uri'
require 'nokogiri'

def get_recipes(ingredient)
  url = "https://www.allrecipes.com/search/results/?search=#{ingredient}"

  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML(html_file)

  results = []

  html_doc.search('.card__detailsContainer')[0..4].each do |element|
    title = element.search('.card__title').text.strip
    description = element.search('.card__summary').text.strip
    results << { title: title, description: description }
  end
  return results
end
