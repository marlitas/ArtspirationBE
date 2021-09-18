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
          Art.create(artsy_id: x[:id])
        end
      end
      info
    end

    def art_categories(number, size)
      art = show_me_art(number, size)
      category = {}
      art.each do |api, url|
        category[api] = CloudVisionService.artwork(url)
      end
      category
    end

    # def jpeg_to_base64(info)
    #   new_hash = {}
    #   info.each do |key, value|
    #     new_hash[key] = Base64.strict_encode64(value)
    #   end
    #   new_hash.each do |key, value|
    #     CloudVisionService.artwork(value)
    #   end
    # end

    # def download_image(url)
    #     open(url) do |u|
    #       File.open('jpg_to_convert.jpg', 'wb') { |f| f.write(u.read) }
    #       base_64_img = File.open('jpg_to_convert.jpg', "rb") do |file|
    #           Base64.strict_encode64(file.read)
    #         end
    #         require 'pry'; binding.pry
    #       CloudVisionService.artwork(base_64_img)
    #     end
    # end
  end
end
