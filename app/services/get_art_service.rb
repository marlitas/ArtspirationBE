# require 'tokenable'
require 'net/http'

class GetArtService
  # include Tokenable
  class << self
    def artwork_sample(size)
      response = conn.get("/api/artworks?size=#{size}")
      parse_json(response)
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

    def artsy_token
      client_id = ENV['client_id']
      client_secret = ENV['client_secret']
      api_url = URI.parse('https://api.artsy.net/api/tokens/xapp_token')
      response = Net::HTTP.post_form(api_url, client_id: client_id, client_secret: client_secret)
      xapp_token = JSON.parse(response.body)['token']
    end
  end
end
