require 'rails_helper'
require './spec/facades/web_mock_stubs'

RSpec.describe 'Recommendations request' do
  before :each do

    Rails.cache.write("recommender_data", nil) if Rails.cache.fetch("recommender_data") != nil

    GetArtFacade.show_me_art(5, 'large')

    @u1 =User.create(name: 'a', email:'a@a.com', token: '12345')
    @u2 =User.create(name: 'b', email:'b@a.com', token: '12346')
    @u3 =User.create(name: 'c', email:'c@a.com', token: '12347')
    @u4 =User.create(name: 'd', email:'d@a.com', token: '12348')
    @u5 =User.create(name: 'e', email:'e@a.com', token: '12349')
    @u1.rated_arts.create(liked: true, art_id:1)
    @u2.rated_arts.create(liked: true, art_id:2)
    @u3.rated_arts.create(liked: true, art_id:3)
    @u4.rated_arts.create(liked: true, art_id:4)
    @u5.rated_arts.create(liked: true, art_id:5)
    @u1.rated_arts.create(liked: false, art_id:5)
    @u2.rated_arts.create(liked: false, art_id:1)
    @u3.rated_arts.create(liked: false, art_id:3)
    @u4.rated_arts.create(liked: false, art_id:2)
    @u5.rated_arts.create(liked: false, art_id:1)
    #performs update for each rating
    RatedArt.all.each do |rated|
      RecommenderService.update_recommender_data(rated)
    end
  end

  it 'can send recommended art', :vcr do
    RecommenderService.update_recommender
    get "/api/v1/users/#{@u1.id}/recommendations"

    res = JSON.parse(response.body)
    expect(@u1.rated_arts.length).to eq(2)

    expect(res['data'].length).to eq(3)

    expect(res['data'][0]).to have_key('id')
    expect(res['data'][0]['id']).to be_a(Integer)

    expect(res['data'][0]).to have_key('type')
    expect(res['data'][0]['type']).to eq('recommended_art')

    expect(res['data'][0]['attributes']).to be_a(Hash)
    expect(res['data'][0]['attributes']).to have_key('title')
    expect(res['data'][0]['attributes']['title']).to be_a(String)
    expect(res['data'][0]['attributes']).to have_key('image')
    expect(res['data'][0]['attributes']['image']).to be_a(String)
    expect(res['data'][0]['attributes']).to have_key('user_id')
    expect(res['data'][0]['attributes']['user_id']).to be_an(Integer)
  end
end
