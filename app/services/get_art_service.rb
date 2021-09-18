require './lib/modules/tokenable'

class GetArtService
  extend Tokenable

  class << self
    def artwork_sample(number, size)
      response = conn.get("/api/artworks?size=#{number}")
      parse_json(response)
    end

    def find_art_by_id(id)
      response = conn.get("/api/artworks/#{id}")
    end

    def conn
      token = artsy_token
      Faraday.new(url: 'https://api.artsy.net') do |req|
        req.headers['X-Xapp-Token'] = "#{token}"
      end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
