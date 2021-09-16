class GetArtFacade
  class << self
    def show_me_art(number, size)
      info = {}
      art_info = GetArtService.artwork_sample(number, size)
      art_info[:_embedded].each do |hash|
        hash[1].each do |x|
          image = x[:_links][:image][:href].gsub('{image_version}', "#{size}")
          info[x[:id]] = image
        end
      end
      @info_values = info.values
      @info = info
      info
    end

    def jpeg_to_base64(info)
      new_hash = {}

      info.each do |key, value|
        new_hash[key] = Base64.strict_encode64(value)
      end
      new_hash
    end
    
    def download_image(url)
      url = @info_values[0]
      open(url) do |u|
        File.open('jpg_to_convert.jpg', 'wb') { |f| f.write(u.read) }
        base_64_img = File.open('jpg_to_convert.jpg', "rb") do |file|
          Base64.strict_encode64(file.read)
        end
        
        # require 'pry'; binding.pry
        # here, you can make a call to the service with the base_64_img
      end
    end

    # urls.each { |url| download_image(url) }  
  end
end
