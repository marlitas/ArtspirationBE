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
        if !value[:responses][0][:labelAnnotations].nil?
          value[:responses][0][:labelAnnotations].each do |description|
            Category.find_or_create_by(name: description[:description])
          end
        end
      end
      category.each do |artsy_id, value|
        if value[:responses][0][:labelAnnotations].nil?
          art = Art.find_by(artsy_id: artsy_id)
          rated_art = RatedArt.where('art_id = ?', art.id)
          rated_art.destroy_all
          art.destroy
        else
          value[:responses][0][:labelAnnotations].each do |description|
            ArtCategory.create(art_id: (Art.find_by(artsy_id: artsy_id).id), category_id: (Category.find_by(name: description[:description]).id), score: description[:topicality])
          end
        end
      end
      category
    end

    def art_color(number, size)
      art = show_me_art(number, size)
      color = {}
      art.each do |artsy_id, url|
        color[artsy_id] = CloudVisionService.artwork(url)
      end
      color
      # Hash Created of cloud vision colors. Next step how to iterate through and group by quadrant.
    end
  end
end
