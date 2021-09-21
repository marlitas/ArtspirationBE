require 'rails_helper'
require_relative './web_mock_stub'

RSpec.describe ArtsyService do
  describe 'Can get art info with artsy id' do
    it 'can get art info' do
      id = '4d8b92b34eb68a1b2c0003f4'

      stub_1 = WebmockStub.mock_one_art

      stub_request(:get, "https://api.artsy.net/api/artworks/#{id}").to_return(status: 200, body: stub_1, headers: {})

      stub_request(:post, "https://api.artsy.net/api/tokens/xapp_token").to_return(status: 200, body: stub_1, headers: {})

      art = ArtsyService.find_art_by_id(id)
      expect(art).to be_a(Hash)

      expect(art).to have_key(:id)
      expect(art[:id]).to be_a(String)

      expect(art).to have_key(:title)
      expect(art[:title]).to be_a(String)

      expect(art).to have_key(:_links)
      expect(art[:_links]).to have_key(:image)
      expect(art[:_links][:image][:href]).to be_a(String)
    end
  end
end
