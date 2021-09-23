require 'rails_helper'
require_relative '../facades/web_mock_stubs'
RSpec.describe 'Recommender Service' do
  before(:all) do
    #clear cache for testing
    # Rails.cache.write("recommender_data", nil) if Rails.cache.fetch("recommender_data") != nil
    # stub_request(:get, "https://api.artsy.net/api/artworks?size=5").to_return(status: 200, body: WebmockStubs.mock_art, headers: {})
    # stub_request(:post, "https://api.artsy.net/api/tokens/xapp_token").to_return(status: 200, body: '12345'.to_json, headers: {})
    #creates 5 art pieces from stubs
    #GetArtFacade.show_me_art(5, 'large')
    @art1 = create(:art, artsy_id: '4d8b92eb4eb68a1b2c000968')
    @art2 = create(:art, artsy_id: '4d8b92ee4eb68a1b2c0009ab')
    @art3 = create(:art, artsy_id: '4d8b937c4eb68a1b2c001722')
    @art4 = create(:art, artsy_id: '4d8b93b04eb68a1b2c001b9d')
    @art5 = create(:art, artsy_id: '4d8b92eb4eb68a1b2c000968')
    @art6 = create(:art, artsy_id: '4eaeecc3d2a5820001006e93')
    @art7 = create(:art, artsy_id: '4eaeedd66899c800010066ac')
    @art8 = create(:art, artsy_id: '4eaef38fec5cf6000100a3f9')

    @u1 =User.create(name: 'a', email:'a@a.com', token: '12345')

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
  # describe 'update_recommender_data' do
  #   it 'adds an additional hash of {user_id, item_id (art), rating} to the cached store' do
  #     updated_cache = Rails.cache.fetch('recommender_data')
  #     expect(updated_cache.length).to eq(10)
  #     expect(updated_cache.last).to eq({user_id: 5, item_id: 1, rating: 1})
  #   end
  # end
  # describe 'update_recommender' do
  #   it 'updates the recommender model when new recommender data is available' do
  #     RecommenderService.update_recommender
  #     u1_recs = RecommenderService.recommend(1)
  #     new_rating = @u1.rated_arts.create(liked: true, art_id: 4)
  #     new_rating = @u1.rated_arts.create(liked: true, art_id: 4)
  #     RecommenderService.update_recommender_data(new_rating)
  #     RecommenderService.update_recommender
  #     updated_recs = RecommenderService.recommend(1)
  #     #updated recs reflect the changes in user ratings
  #     expect(u1_recs).to_not eq(updated_recs)
  #   end
  # end
  describe 'recommend' do
    it 'when given a user id, returns a list of recommended art sorted by rating desc' do
      recs = RecommenderService.recommend_art(@u1.id, 2)

      expect(recs.length).to eq(2)
      expect(recs).to be_an(Array)
      expect(recs.first).to be_a(Art)
    end
  end
end
