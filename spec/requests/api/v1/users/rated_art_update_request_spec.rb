require 'rails_helper'
require './spec/facades/web_mock_stubs'
require './spec/services/web_mock_stub'

RSpec.describe 'Rated Art Update' do
  before :each do
    @u1 = create(:user)
    stub_1 = WebmockStubs.mock_art
    stub_2 = JSON.parse(stub_1)
    GetArtFacade.show_me_art(5, 'large')
    # stub_request(:post, "https://api.artsy.net/api/tokens/xapp_token").
    #      with(
    #        body: {"client_id"=>"3429ac42498f465efb3e", "client_secret"=>"7370bb88035545c70458ea97dd06a3c1"},
    #        headers: {
    #    	  'Accept'=>'*/*',
    #    	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    #    	  'Content-Type'=>'application/x-www-form-urlencoded',
    #    	  'Host'=>'api.artsy.net',
    #    	  'User-Agent'=>'Ruby'
    #        }).
    #      to_return(status: 200, body: "", headers: {})
    #
    # stub_request(:get, "https://api.artsy.net/api/artworks?size=5").to_return(status: 200, body: stub_1, headers: {})
    # stub_request(:post, "https://api.artsy.net/api/tokens/xapp_token").to_return(status: 200, body: stub_1, headers: {})
    # stub_request(:get, "https://api.artsy.net/api/artworks/#{stub_2['_embedded']['artworks'][0]['id']}?X-Xapp-Token=").to_return(status: 200, body: stub_2['_embedded']['artworks'][0].to_json, headers: {})
    # stub_request(:get, "https://api.artsy.net/api/artworks/#{stub_2['_embedded']['artworks'][1]['id']}?X-Xapp-Token=").to_return(status: 200, body: stub_2['_embedded']['artworks'][1].to_json, headers: {})
  end

  it 'can update art to be liked rated art', :vcr do
    expect(Art.all.count).to eq(5)
    expect(User.all.count).to eq(1)
    expect(RatedArt.all.count).to eq(0)

    patch "/api/v1/users/1/rated_arts/#{Art.first.id}", params: {liked: true}
    res = JSON.parse(response.body)

    expect(RatedArt.all.count).to eq(1)

    expect(res['data']).to have_key('id')
    expect(res['data']['id']).to be_a(Integer)

    expect(res['data']).to have_key('type')
    expect(res['data']['type']).to eq('rated_art')

    expect(res['data']['attributes']).to be_a(Hash)
    expect(res['data']['attributes']).to have_key('title')
    expect(res['data']['attributes']['title']).to be_a(String)
    expect(res['data']['attributes']).to have_key('image')
    expect(res['data']['attributes']['image']).to be_a(String)
    expect(res['data']['attributes']).to have_key('user_id')
    expect(res['data']['attributes']['user_id']).to be_an(Integer)
    expect(res['data']['attributes']).to have_key('liked')
    expect(res['data']['attributes']['liked']).to eq(true)
  end

   it 'can change disliked art to liked art', :vcr do
     rated_art = RatedArt.create!(art_id: Art.second.id, user_id: @u1.id, liked: false)
     expect(RatedArt.all.count).to eq(1)

     patch "/api/v1/users/1/rated_arts/#{Art.second.id}", params: {liked: true}
     res = JSON.parse(response.body)


     expect(res['data']).to have_key('id')
     expect(res['data']['id']).to be_a(Integer)

     expect(res['data']).to have_key('type')
     expect(res['data']['type']).to eq('rated_art')

     expect(res['data']['attributes']).to be_a(Hash)
     expect(res['data']['attributes']).to have_key('title')
     expect(res['data']['attributes']['title']).to be_a(String)
     expect(res['data']['attributes']).to have_key('image')
     expect(res['data']['attributes']['image']).to be_a(String)
     expect(res['data']['attributes']).to have_key('user_id')
     expect(res['data']['attributes']['user_id']).to be_an(Integer)
     expect(res['data']['attributes']).to have_key('liked')
     expect(res['data']['attributes']['liked']).to eq(true)
   end

   it 'can change liked art to disliked art', :vcr do
     rated_art = RatedArt.create!(art_id: Art.second.id, user_id: @u1.id, liked: true)
     expect(RatedArt.all.count).to eq(1)

     patch "/api/v1/users/1/rated_arts/#{Art.second.id}", params: {liked: false}
     res = JSON.parse(response.body)


     expect(res['data']).to have_key('id')
     expect(res['data']['id']).to be_a(Integer)

     expect(res['data']).to have_key('type')
     expect(res['data']['type']).to eq('rated_art')

     expect(res['data']['attributes']).to be_a(Hash)
     expect(res['data']['attributes']).to have_key('title')
     expect(res['data']['attributes']['title']).to be_a(String)
     expect(res['data']['attributes']).to have_key('image')
     expect(res['data']['attributes']['image']).to be_a(String)
     expect(res['data']['attributes']).to have_key('user_id')
     expect(res['data']['attributes']['user_id']).to be_an(Integer)
     expect(res['data']['attributes']).to have_key('liked')
     expect(res['data']['attributes']['liked']).to eq(false)
   end
end
