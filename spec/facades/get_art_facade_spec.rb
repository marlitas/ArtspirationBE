require_relative './web_mock_stubs'
require 'rails_helper'


describe GetArtFacade do
  # context "instance methods" do
  #   it "returns art selections" do
  #     number = 2
  #     size = 'large'
  #     selection = GetArtFacade.show_me_art(number, size)

  #     stub_request(:post, "https://vision.googleapis.com/v1/images:annotate?key=sadatay").to_return(status: 200, body: stub)

  #     expect(selection).to be_an Hash
  #     expect(selection.count).to eq(2)
  #     expect(selection.keys.first).to be_a(String)
  #     expect(selection.values.first).to be_a(String)
  #   end
  # end

  context 'Find image categories' do
    it 'converts jpeg to categories' do
      # number = 1
      # size = 'large'
      # stub_request(:get, )
      # selection = GetArtFacade.show_me_art(number, size)
      stub_1 = WebmockStubs.mock_art
      stub_request(:get, "https://api.artsy.net/api/tokens/xapp_token").to_return(status: 200, body: stub_1)

      stub_2 = WebmockStubs.mock_categories
      stub_request(:post, "https://vision.googleapis.com/v1/images:annotate?key=sadatay").to_return(status: 200, body: stub_2)

      # expect(selection.class).to eq(Hash)
      # expect(selection["4d8b92eb4eb68a1b2c000968"][:responses][0][:labelAnnotations][0][:description].class).to eq(String)
    end
  end
end
