require 'rails_helper'
require_relative './web_mock_stubs'

RSpec.describe ArtsyFacade do
  it 'can get art info', :vcr do
    id = '4d8b92eb4eb68a1b2c000968'
    #
    # stub_1 = WebmockStubs.mock_one_art

    # stub_request(:get, "https://api.artsy.net/api/artworks/#{id}").to_return(status: 200, body: stub_1, headers: {})
    #
    # stub_request(:post, "https://api.artsy.net/api/tokens/xapp_token").to_return(status: 200, body: stub_1, headers: {})

    art = ArtsyFacade.find_art_by_id(id)

    expect(art).to be_a(Hash)
  end
end
