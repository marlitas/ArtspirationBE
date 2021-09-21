require './lib/modules/tokenable'

class ArtsyService
  extend Tokenable

  class << self
    def find_art_by_id(id) #For finding art by artsy_id
      response = conn.get("/api/artworks/#{id}")
      parse_json(response)
    end

    def conn
      token = artsy_token
      Faraday.new(url: 'https://api.artsy.net') do |req|
        req.params['X-Xapp-Token'] = "#{token}"
      end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
