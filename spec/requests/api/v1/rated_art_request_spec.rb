require 'rails_helper'

RSpec.describe 'Rated Art Index' do
  before :each do
    @u1 = create(:user)
    # @user_2 = create(:user)
    #
    # @art_1 = Art.create!(artsy_id: '4d8b92b34eb68a1b2c0003f4')
    # @art_2 = Art.create!(artsy_id: '3334')
    # @art_3 = Art.create!(artsy_id: '1414')

    stub_1 = WebmockStubs.mock_art

    stub_request(:get, "https://api.artsy.net/api/artworks?size=5").to_return(status: 200, body: stub_1, headers: {})

    stub_request(:post, "https://api.artsy.net/api/tokens/xapp_token").to_return(status: 200, body: stub_1, headers: {})

    GetArtFacade.show_me_art(5, 'large')

    @u1.rated_arts.create(liked: true, art_id:1)
    @u1.rated_arts.create(liked: true, art_id:2)
    @u1.rated_arts.create(liked: false, art_id:3)
    # @u1.rated_arts.create(liked: true, art_id:4)
    # @u1.rated_arts.create(liked: false, art_id:5)
    #
    # @ra_1 = RatedArt.create!(user_id: @user_1.id, art_id: @art_1.id, liked: true)
    # @ra_2 = RatedArt.create!(user_id: @user_1.id, art_id: @art_2.id, liked: true)
    # @ra_3 = RatedArt.create!(user_id: @user_1.id, art_id: @art_3.id, liked: false)
binding.pry
  end

  it 'can find a users liked art' do
    # id = '4d8b92b34eb68a1b2c0003f4'
    #
    stub_2 = WebmockStubs.mock_art
    #
    stub_request(:get, "https://api.artsy.net/api/artworks/#{Art.first.artsy_id}").to_return(status: 200, body: stub_2.first, headers: {})

    stub_request(:get, "https://api.artsy.net/api/artworks/#{Art.all[1].artsy_id}").to_return(status: 200, body: stub_2[1], headers: {})

    #
    # stub_request(:post, "https://api.artsy.net/api/tokens/xapp_token").to_return(status: 200, body: stub_2, headers: {})

    get '/api/v1/rated_arts', params: {user_id: @u1.id}
    expect(@u1.rated_arts.length).to eq(3)
  end
end
