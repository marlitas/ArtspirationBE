require 'rails_helper'
require './spec/facades/web_mock_stubs'

RSpec.describe 'Recommendations request' do
  before :each do

    # Rails.cache.write("recommender_data", nil) if Rails.cache.fetch("recommender_data") != nil

    @art1 = create(:art, artsy_id: '4d8b92eb4eb68a1b2c000968')
    @art2 = create(:art, artsy_id: '4d8b92ee4eb68a1b2c0009ab')
    @art3 = create(:art, artsy_id: '4d8b937c4eb68a1b2c001722')
    @art4 = create(:art, artsy_id: '4d8b93b04eb68a1b2c001b9d')
    @art5 = create(:art, artsy_id: '4d8b92eb4eb68a1b2c000968')
    @art6 = create(:art, artsy_id: '4eaeecc3d2a5820001006e93')
    @art7 = create(:art, artsy_id: '4eaeedd66899c800010066ac')
    @art8 = create(:art, artsy_id: '4eaef38fec5cf6000100a3f9')

    @u1 =User.create(name: 'a', email:'a@a.com', token: '12345')
    @u2 =User.create(name: 'b', email:'b@a.com', token: '12346')

    @cat1 = create(:category)
    @cat2 = create(:category)
    @cat3 = create(:category)
    @cat4 = create(:category)
    @cat5 = create(:category)
    @cat6 = create(:category)
    @cat7 = create(:category)
    @cat8 = create(:category)
    @cat9 = create(:category)
    @cat10 = create(:category)

    @u1.rated_arts.create!(art_id: @art1.id, liked: true)
    @u1.rated_arts.create!(art_id: @art2.id, liked: true)
    @u1.rated_arts.create!(art_id: @art3.id, liked: true)
    @u1.rated_arts.create!(art_id: @art4.id, liked: true)
    @u1.rated_arts.create!(art_id: @art5.id, liked: false)

    @art1.art_categories.create!(category_id: @cat1.id, score: 0.75)
    @art1.art_categories.create!(category_id: @cat2.id, score: 0.50)
    @art1.art_categories.create!(category_id: @cat3.id, score: 0.80)

    @art2.art_categories.create!(category_id: @cat1.id, score: 0.90)
    @art2.art_categories.create!(category_id: @cat2.id, score: 0.60)
    @art2.art_categories.create!(category_id: @cat4.id, score: 0.50)

    @art3.art_categories.create!(category_id: @cat1.id, score: 0.70)
    @art3.art_categories.create!(category_id: @cat5.id, score: 0.78)
    @art3.art_categories.create!(category_id: @cat6.id, score: 0.68)

    @art4.art_categories.create!(category_id: @cat5.id, score: 0.55)
    @art4.art_categories.create!(category_id: @cat6.id, score: 0.45)
    @art4.art_categories.create!(category_id: @cat7.id, score: 0.85)

    @art5.art_categories.create!(category_id: @cat3.id, score: 0.55)
    @art5.art_categories.create!(category_id: @cat4.id, score: 0.45)
    @art5.art_categories.create!(category_id: @cat9.id, score: 0.85)

    @art6.art_categories.create!(category_id: @cat1.id, score: 0.70)
    @art6.art_categories.create!(category_id: @cat8.id, score: 0.60)
    @art6.art_categories.create!(category_id: @cat4.id, score: 0.50)

    @art7.art_categories.create!(category_id: @cat5.id, score: 0.80)
    @art7.art_categories.create!(category_id: @cat8.id, score: 0.90)
    @art7.art_categories.create!(category_id: @cat10.id, score: 0.50)

    @art8.art_categories.create!(category_id: @cat1.id, score: 0.80)
    @art8.art_categories.create!(category_id: @cat2.id, score: 0.90)
    @art8.art_categories.create!(category_id: @cat3.id, score: 0.90)
    #performs update for each rating
    # RatedArt.all.each do |rated|
    #   RecommenderService.update_recommender_data(rated)
    # end
  end

  it 'can send recommended art', :vcr do
    # RecommenderService.update_recommender
    get "/api/v1/users/#{@u1.id}/recommendations"

    res = JSON.parse(response.body)
    expect(@u1.rated_arts.length).to eq(5)

    expect(res['data'].length).to eq(1)

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
