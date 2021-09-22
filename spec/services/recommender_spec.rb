require 'rails_helper'
require_relative '../facades/web_mock_stubs'
RSpec.describe 'Recommender Service' do
  before(:all) do
    #clear cache for testing
    Rails.cache.write("recommender_data", nil) if Rails.cache.fetch("recommender_data") != nil
    stub_request(:get, "https://api.artsy.net/api/artworks?size=5").to_return(status: 200, body: WebmockStubs.mock_art, headers: {})
    stub_request(:post, "https://api.artsy.net/api/tokens/xapp_token").to_return(status: 200, body: '12345'.to_json, headers: {})
    #creates 5 art pieces from stubs
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
  describe 'update_recommender_data' do
    it 'adds an additional hash of {user_id, item_id (art), rating} to the cached store' do
      updated_cache = Rails.cache.fetch('recommender_data')
      expect(updated_cache.length).to eq(10)
      expect(updated_cache.last).to eq({user_id: 5, item_id: 1, rating: 1})
    end
  end
  describe 'update_recommender' do
    it 'updates the recommender model when new recommender data is available' do
      RecommenderService.update_recommender
      u1_recs = RecommenderService.recommend(1)
      new_rating = @u1.rated_arts.create(liked: true, art_id: 4)
      new_rating = @u1.rated_arts.create(liked: true, art_id: 4)
      RecommenderService.update_recommender_data(new_rating)
      RecommenderService.update_recommender
      updated_recs = RecommenderService.recommend(1)
      #updated recs reflect the changes in user ratings
      expect(u1_recs).to_not eq(updated_recs)
    end
  end
  describe 'recommend' do
    it 'when given a user id, returns a list of recommended art sorted by rating desc' do
      recs = RecommenderService.recommend(1)
      expect(recs[0][:score]).to be > (recs[1][:score])
      expect(recs.length).to eq(2)
    end
  end
end
