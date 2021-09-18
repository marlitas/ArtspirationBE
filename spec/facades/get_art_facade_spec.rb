require_relative './web_mock_stubs'
require 'rails_helper'

describe GetArtFacade do
  context "instance methods" do
    it "returns art selections" do
      number = 5
      size = 'large'

      stub_1 = WebmockStubs.mock_art

      stub_request(:get, "https://api.artsy.net/api/artworks?size=5").to_return(status: 200, body: stub_1, headers: {})
      stub_request(:post, "https://api.artsy.net/api/tokens/xapp_token").to_return(status: 200, body: stub_1, headers: {})

      selection = GetArtFacade.show_me_art(number, size)

      expected = {"4d8b92eb4eb68a1b2c000968"=>"https://d32dm0rphc51dk.cloudfront.net/NOpIAwQa-3r51Cg9qXKbfA/large.jpg",
        "4d8b92ee4eb68a1b2c0009ab"=>"https://d32dm0rphc51dk.cloudfront.net/m4X41Fun8gpDjn7Gat9cUg/large.jpg",
        "4d8b93394eb68a1b2c0010fa"=>"https://d32dm0rphc51dk.cloudfront.net/IG8ZLvVmZgQiTn2zK0Bp8w/large.jpg",
        "4d8b937c4eb68a1b2c001722"=>"https://d32dm0rphc51dk.cloudfront.net/5L1xjKC_und1uiKCpUPHhw/large.jpg",
        "4d8b93b04eb68a1b2c001b9d"=>"https://d32dm0rphc51dk.cloudfront.net/zFA7cwdkWxbIrmuAAd21VA/large.jpg"}

      expect(selection).to be_an Hash
      expect(selection).to eq(expected)
      expect(selection.count).to eq(5)
      expect(selection.keys.first).to be_a(String)
      expect(selection.values.first).to be_a(String)
    end
  end

  context 'Find image categories' do
    it 'converts jpeg to categories' do
      number = 5
      size = 'large'

      stub_1 = WebmockStubs.mock_art

      stub_request(:get, "https://api.artsy.net/api/artworks?size=5").to_return(status: 200, body: stub_1, headers: {})
      stub_request(:post, "https://api.artsy.net/api/tokens/xapp_token").to_return(status: 200, body: stub_1, headers: {})

      # selection = GetArtFacade.show_me_art(number, size)

      stub_2 = WebmockStubs.mock_categories

      stub_request(:post, "https://vision.googleapis.com/v1/images:annotate?key=AIzaSyCgvj06GZCroOgXrg1E7nQMPijcYh_BMJ0").to_return(status: 200, body: stub_2)
     
      selection = GetArtFacade.art_categories(number, size)
      
      expected = {
      "4d8b92eb4eb68a1b2c000968"=>
        {:responses=>
          [{:labelAnnotations=>
             [{:mid=>"/m/07j7r", :description=>"Tree", :score=>0.8316971, :topicality=>0.8316971},
              {:mid=>"/m/0jjw", :description=>"Art", :score=>0.82273906, :topicality=>0.82273906},
              {:mid=>"/m/083vt", :description=>"Wood", :score=>0.8041993, :topicality=>0.8041993},
              {:mid=>"/m/0j62f", :description=>"Rectangle", :score=>0.7840926, :topicality=>0.7840926},
              {:mid=>"/m/05y4t", :description=>"Paint", :score=>0.77848625, :topicality=>0.77848625}]}]},
       "4d8b92ee4eb68a1b2c0009ab"=>
        {:responses=>
          [{:labelAnnotations=>
             [{:mid=>"/m/07j7r", :description=>"Tree", :score=>0.8316971, :topicality=>0.8316971},
              {:mid=>"/m/0jjw", :description=>"Art", :score=>0.82273906, :topicality=>0.82273906},
              {:mid=>"/m/083vt", :description=>"Wood", :score=>0.8041993, :topicality=>0.8041993},
              {:mid=>"/m/0j62f", :description=>"Rectangle", :score=>0.7840926, :topicality=>0.7840926},
              {:mid=>"/m/05y4t", :description=>"Paint", :score=>0.77848625, :topicality=>0.77848625}]}]},
       "4d8b93394eb68a1b2c0010fa"=>
        {:responses=>
          [{:labelAnnotations=>
             [{:mid=>"/m/07j7r", :description=>"Tree", :score=>0.8316971, :topicality=>0.8316971},
              {:mid=>"/m/0jjw", :description=>"Art", :score=>0.82273906, :topicality=>0.82273906},
              {:mid=>"/m/083vt", :description=>"Wood", :score=>0.8041993, :topicality=>0.8041993},
              {:mid=>"/m/0j62f", :description=>"Rectangle", :score=>0.7840926, :topicality=>0.7840926},
              {:mid=>"/m/05y4t", :description=>"Paint", :score=>0.77848625, :topicality=>0.77848625}]}]},
       "4d8b937c4eb68a1b2c001722"=>
        {:responses=>
          [{:labelAnnotations=>
             [{:mid=>"/m/07j7r", :description=>"Tree", :score=>0.8316971, :topicality=>0.8316971},
              {:mid=>"/m/0jjw", :description=>"Art", :score=>0.82273906, :topicality=>0.82273906},
              {:mid=>"/m/083vt", :description=>"Wood", :score=>0.8041993, :topicality=>0.8041993},
              {:mid=>"/m/0j62f", :description=>"Rectangle", :score=>0.7840926, :topicality=>0.7840926},
              {:mid=>"/m/05y4t", :description=>"Paint", :score=>0.77848625, :topicality=>0.77848625}]}]},
       "4d8b93b04eb68a1b2c001b9d"=>
        {:responses=>
          [{:labelAnnotations=>
             [{:mid=>"/m/07j7r", :description=>"Tree", :score=>0.8316971, :topicality=>0.8316971},
              {:mid=>"/m/0jjw", :description=>"Art", :score=>0.82273906, :topicality=>0.82273906},
              {:mid=>"/m/083vt", :description=>"Wood", :score=>0.8041993, :topicality=>0.8041993},
              {:mid=>"/m/0j62f", :description=>"Rectangle", :score=>0.7840926, :topicality=>0.7840926},
              {:mid=>"/m/05y4t", :description=>"Paint", :score=>0.77848625, :topicality=>0.77848625}]}]}}

        expect(selection.class).to eq(Hash)
        expect(selection).to eq(expected)
    end
  end
end

# require_relative './web_mock_stubs'
# require 'rails_helper'


# describe GetArtFacade do
#   # context "instance methods" do
#   #   it "returns art selections" do
#   #     number = 2
#   #     size = 'large'
#   #     selection = GetArtFacade.show_me_art(number, size)

#   #     stub_request(:post, "https://vision.googleapis.com/v1/images:annotate?key=sadatay").to_return(status: 200, body: stub)

#   #     expect(selection).to be_an Hash
#   #     expect(selection.count).to eq(2)
#   #     expect(selection.keys.first).to be_a(String)
#   #     expect(selection.values.first).to be_a(String)
#   #   end
#   # end

#   context 'Find image categories' do
#     it 'converts jpeg to categories' do
#       # number = 1
#       # size = 'large'
#       # stub_request(:get, )
#       # selection = GetArtFacade.show_me_art(number, size)
#       stub_1 = WebmockStubs.mock_art
#       stub_request(:get, "https://api.artsy.net/api/tokens/xapp_token").to_return(status: 200, body: stub_1)

#       stub_2 = WebmockStubs.mock_categories
#       stub_request(:post, "https://vision.googleapis.com/v1/images:annotate?key=sadatay").to_return(status: 200, body: stub_2)
      
#       stub_request(:post, "https://api.artsy.net/api/tokens/xapp_token").
#       with(
#         body: {"client_id"=>"3429ac42498f465efb3e", "client_secret"=>"7370bb88035545c70458ea97dd06a3c1"},
#         headers: {
#               'Accept'=>'*/*',
#               'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
#               'Content-Type'=>'application/x-www-form-urlencoded',
#               'Host'=>'api.artsy.net',
#               'User-Agent'=>'Ruby'
#         }).to_return(status: 200, body: "", headers: {})

#       # expect(selection.class).to eq(Hash)
#       # expect(selection["4d8b92eb4eb68a1b2c000968"][:responses][0][:labelAnnotations][0][:description].class).to eq(String)
#     end
#   end
# end
