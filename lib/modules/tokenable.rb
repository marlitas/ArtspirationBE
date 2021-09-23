require 'net/http'

module Tokenable
  def artsy_token
    client_id = ENV['client_id']
    client_secret = ENV['client_secret']
    if Rails.cache.fetch('token') == nil
      api_url = URI.parse('https://api.artsy.net/api/tokens/xapp_token')
      response = Net::HTTP.post_form(api_url, client_id: client_id, client_secret: client_secret)
      Rails.cache.write('token', JSON.parse(response.body)['token'], expires_in: 3.days)
    end
    xapp_token = Rails.cache.fetch('token')
  end
end
