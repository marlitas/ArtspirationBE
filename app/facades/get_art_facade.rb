require 'base64'
require 'open-uri'

class GetArtFacade
  class << self
    def show_me_art(number, size)
      info = {}
      art_info = GetArtService.artwork_sample(number, size)
      art_info[:_embedded].each do |hash|
        hash[1].each do |x|
          image = x[:_links][:image][:href].gsub('{image_version}', "#{size}")
          info[x[:id]] = image
          Art.find_or_create_by(artsy_id: x[:id])
        end
      end
      info
    end

    def art_categories(number, size)
      art = show_me_art(number, size)
      category = {}
      art.each do |artsy_id, url|
        category[artsy_id] = CloudVisionService.artwork(url)
      end
      category.values.each do |value|
        value[:responses][0][:labelAnnotations].each do |description|
          Category.find_or_create_by(name: description[:description])
        end
      end
      category
    #  art_category = category.each do |key, value|
    #   hash = {} 
    #     category.values.each do |value2|
    #       value[:responses][0][:labelAnnotations].each do |description|
    #         hash[key].push(description[:description])
    #       end
    #     end
    #   end
    #   art_category
    #   require 'pry'; binding.pry
    end
  end
end
