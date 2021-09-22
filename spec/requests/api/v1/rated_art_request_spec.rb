require 'rails_helper'
require_relative '../../../facades/web_mock_stubs'
require_relative '../../../services/web_mock_stub'
RSpec.describe 'Rated Art Index' do
  before :each do
    @u1 = create(:user)
    # @user_2 = create(:user)
    #
    # @art_1 = Art.create!(artsy_id: '4d8b92b34eb68a1b2c0003f4')
    # @art_2 = Art.create!(artsy_id: '3334')
    # @art_3 = Art.create!(artsy_id: '1414')

    stub_1 = WebmockStubs.mock_art
    stub_2 = JSON.parse(WebmockStubs.mock_art)


    stub_request(:get, "https://api.artsy.net/api/artworks?size=5").to_return(status: 200, body: stub_1, headers: {})
    stub_request(:post, "https://api.artsy.net/api/tokens/xapp_token").to_return(status: 200, body: stub_1, headers: {})

    GetArtFacade.show_me_art(5, 'large')
    @u1.rated_arts.create(liked: true, art_id:1)
    @u1.rated_arts.create(liked: true, art_id:2)
    @u1.rated_arts.create(liked: false, art_id:3)
    stub_request(:get, "https://api.artsy.net/api/artworks/#{stub_2['_embedded']['artworks'][0]['id']}?X-Xapp-Token=").to_return(status: 200, body: stub_2['_embedded']['artworks'][0].to_json, headers: {})
    stub_request(:get, "https://api.artsy.net/api/artworks/#{stub_2['_embedded']['artworks'][1]['id']}?X-Xapp-Token=").to_return(status: 200, body: stub_2['_embedded']['artworks'][1].to_json, headers: {})
  end

  it 'can find a users liked art' do
    get '/api/v1/users/1/rated_arts', params: {user_id: @u1.id}
    res = JSON.parse(response.body)
    expect(@u1.rated_arts.length).to eq(3)
    expect(res['data'].length).to eq(2)

    expect(res['data'][0]).to have_key('id')
    expect(res['data'][0]['id']).to be_a(Integer)

    expect(res['data'][0]).to have_key('type')
    expect(res['data'][0]['type']).to eq('liked_art')

    expect(res['data'][0]['attributes']).to be_a(Hash)
    expect(res['data'][0]['attributes']).to have_key('title')
    expect(res['data'][0]['attributes']['title']).to be_a(String)
    expect(res['data'][0]['attributes']).to have_key('image')
    expect(res['data'][0]['attributes']['image']).to be_a(String)
    expect(res['data'][0]['attributes']).to have_key('user_id')
    expect(res['data'][0]['attributes']['user_id']).to be_an(Integer)

  end
end
