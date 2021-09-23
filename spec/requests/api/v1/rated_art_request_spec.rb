require 'rails_helper'
require_relative '../../../facades/web_mock_stubs'
require_relative '../../../services/web_mock_stub'
RSpec.describe 'Rated Art' do
  before :each do
    @u1 = create(:user)

    GetArtFacade.show_me_art(5, 'large')
    @u1.rated_arts.create(liked: true, art_id:Art.first.id)
    @u1.rated_arts.create(liked: true, art_id:Art.second.id)
    @u1.rated_arts.create(liked: false, art_id:Art.third.id)
  end

  it 'can find a users liked art', :vcr do
    get "/api/v1/users/#{@u1.id}/rated_arts", params: {user_id: @u1.id}
    res = JSON.parse(response.body)
    expect(@u1.rated_arts.length).to eq(3)
    expect(res['data'].length).to eq(2)

    expect(res['data'][0]).to have_key('id')
    expect(res['data'][0]['id']).to be_a(Integer)

    expect(res['data'][0]).to have_key('type')
    expect(res['data'][0]['type']).to eq('rated_art')

    expect(res['data'][0]['attributes']).to be_a(Hash)
    expect(res['data'][0]['attributes']).to have_key('title')
    expect(res['data'][0]['attributes']['title']).to be_a(String)
    expect(res['data'][0]['attributes']).to have_key('image')
    expect(res['data'][0]['attributes']['image']).to be_a(String)
    expect(res['data'][0]['attributes']).to have_key('user_id')
    expect(res['data'][0]['attributes']['user_id']).to be_an(Integer)
    expect(res['data'][0]['attributes']).to have_key('liked')
    expect(res['data'][0]['attributes']['liked']).to eq(true)
  end

  it 'can return liked art', :vcr do
    get "/api/v1/users/#{@u1.id}/rated_arts/#{@u1.rated_arts[0].art_id}" , params: { user_id: @u1.id, id: @u1.rated_arts[0].art_id }
    res = JSON.parse(response.body)

    expect(res['data']['id']).to eq(Art.first.id)
    expect(res['data']['type']).to eq('rated_art')
    expect(res['data']['attributes']['title']).to eq('Der Kuss (The Kiss)')
    expect(res['data']['attributes']['liked']).to eq(true)
    expect(res['data']['attributes']['user_id']).to eq(@u1.id)
    expect(res['data']['attributes']['image']).to be_a(String)
  end

  it 'can return liked art recommendation', :vcr do
    get "/api/v1/users/#{@u1.id}/rated_arts/#{@u1.rated_arts[2].art_id}" #, params: { user_id: @u1.id }
    res = JSON.parse(response.body)

    expect(res['data']['id']).to eq(Art.third.id)
    expect(res['data']['type']).to eq('rated_art')
    expect(res['data']['attributes']['title']).to eq('The Company of Frans Banning Cocq and Willem van Ruytenburch (The Night Watch)')
    expect(res['data']['attributes']['liked']).to eq(false)
    expect(res['data']['attributes']['user_id']).to eq(@u1.id)
    expect(res['data']['attributes']['image']).to be_a(String)
  end
end
