require './lib/modules/tokenable'

class ArtsyService
  extend Tokenable

  class << self
    def find_art_by_id(artsy_id) #For finding art by artsy_id
      cache = Rails.cache.fetch(artsy_id)
      if cache == nil 
        response = conn.get("/api/artworks/#{artsy_id}")
        formatted_res = JSON.parse(response.body, symbolize_names: true)
        Rails.cache.write(formatted_res[:id], formatted_res)
      else
        cache
      end
    end

    def conn
      token = artsy_token
      Faraday.new(url: 'https://api.artsy.net') do |req|
        req.headers['X-Xapp-Token'] = "#{token}"
      end
    end

    def parse_json(response)
      formatted_res = JSON.parse(response.body, symbolize_names: true)
      cache = Rails.cache.fetch(formatted_res[:id])
    end
  end
end

