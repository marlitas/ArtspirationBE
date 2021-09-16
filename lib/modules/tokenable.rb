require 'net/http'

module Tokenable
  def artsy_token
    client_id = ENV['client_id']
    client_secret = ENV['client_secret']
    api_url = URI.parse('https://api.artsy.net/api/tokens/xapp_token')
    response = Net::HTTP.post_form(api_url, client_id: client_id, client_secret: client_secret)
    xapp_token = JSON.parse(response.body)['token']
  end
end
