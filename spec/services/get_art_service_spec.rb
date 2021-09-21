require 'rails_helper'
require_relative './web_mock_stub' 

RSpec.describe GetArtService do
  describe 'Random sample of art work' do
    xit 'exposes artwork api' do
      

      number = 100
      size = 'large'

      response = GetArtService.artwork_sample(number, size)
      art_data = response[:_embedded][:artworks]
      expect(response).to be_a(Hash)
      expect(art_data).to be_a(Array)

    #   stub = WebmockStub.mock_collection
    #   stub_request(:get, "https://api.artsy.net/api=/artworks?size=large?number=100")
    #   # .with(body: {"client_id"=>"3429ac42498f465efb3e", "client_secret"=>"7370bb88035545c70458ea97dd06a3c1"},
    #   #      headers: {
    #   #       'Accept'=>'*/*',
    #   #       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    #   #       'Content-Type'=>'application/x-www-form-urlencoded',
    #   #       'Host'=>'api.artsy.net',
    #   #       'User-Agent'=>'Ruby'
    #   #  }).to_return(status: 200, body: "", headers: {})
    #  collection = GetArtFacade.show_me_art(1)
    #  expect(:status).to eq(200)
    end
  end
end

# # spec/spec_helper.rb
# RSpec.configure do |config|
#   config.before(:each) do
#     stub_request(:get, /api.github.com/).
#       with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
#       to_return(status: 200, body: "stubbed response", headers: {})
#   end
