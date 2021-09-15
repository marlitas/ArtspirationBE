require 'json'
require 'faraday'
require 'net/http'

class ArtsyService
  class << self
    def get_token
      client_id = '3429ac42498f465efb3e'
      client_secret = '7370bb88035545c70458ea97dd06a3c1'
      api_url = URI.parse('https://api.artsy.net/api/tokens/xapp_token')
      response = Net::HTTP.post_form(api_url, client_id: client_id, client_secret: client_secret)
      xapp_token = JSON.parse(response.body)['token']
    end
    
    def call_db
    token = get_token
    response = Faraday.get("https://api.artsy.net/api/artworks") do |req|
      req.params[:size] = 50
      req.headers['X-Xapp-Token'] = "#{token}" 
    end
    body = JSON.parse(response.body, symbolize_names: true) 
    require 'pry'; binding.pry
    end
  end
end