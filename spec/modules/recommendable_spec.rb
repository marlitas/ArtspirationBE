require 'rails_helper'
require './lib/modules/recommendable'

class DummyClass
  extend Recommendable
end

RSpec.describe Recommendable do
  before :each do
    @u1 = create(:user)

    @art1 = create(:art)
    @art2 = create(:art)
    @art3 = create(:art)
    @art4 = create(:art)
    @art5 = create(:art)
    @art6 = create(:art)
    @art7 = create(:art)
    @art8 = create(:art)

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

  end

  describe 'user_liked_categories' do
    it 'can find categories a user has liked' do
      response = DummyClass.user_liked_categories(@u1.id)

      expect(response.length).to eq(12)
      expect(response.first.category_id).to eq(@cat1.id)
      expect(response.last.category_id).to eq(@cat7.id)
    end

    it 'can create a user category hash' do
      response = DummyClass.user_category_hash(@u1.id)

      expect(response).to be_a(Hash)
      expect(response.length).to eq(7)
      expect(response.keys.first).to eq(@cat1.id)
      expect(response.values.first).to eq(3)
      expect(response.keys.last).to eq(@cat7.id)
      expect(response.values.last).to eq(1)
    end
  end

  describe 'art_category_hash' do
    it 'can find categories related to specific art' do
      response = DummyClass.art_categories(@art1.id)

      expect(response.length).to eq(3)
      expect(response.first.category_id).to eq(@cat1.id)
      expect(response.last.category_id).to eq(@cat3.id)
    end

    it 'can create an art category hash' do
      response = DummyClass.art_category_hash(@art1.id)

      expect(response).to be_a(Hash)
      expect(response.length).to eq(3)
      expect(response.keys.first).to eq(@cat1.id)
      expect(response.values.first).to eq(0.75)
      expect(response.keys.last).to eq(@cat3.id)
      expect(response.values.last).to eq(0.80)
    end
  end

  describe 'add_missing_categories' do
    it 'can add missing categories to user hash' do
      response = DummyClass.user_missing_categories(@u1.id, @art6.id)

      expect(response).to be_a(Hash)
      expect(response.length).to eq(8)
      expect(response[@cat8.id]).to eq(0)
    end

    it 'can add missing categories to art hash' do
      response = DummyClass.art_missing_categories(@u1.id, @art6.id)

      expect(response).to be_a(Hash)
      expect(response.length).to eq(8)
      expect(response[@cat2.id]).to eq(0)
    end
  end

  describe 'recommendation score' do
    it 'can calculate recommendation score' do
      response = DummyClass.recommendation_score(@u1.id, @art6.id)

      expect(response).to be_a(Float)
      expect(response).to eq(2.6)
    end
  end

  describe 'unrated_art' do
    it 'can return art user has not rated' do
      response = DummyClass.unrated_art(@u1.id)

      expect(response).to eq([@art6, @art7, @art8])
    end
  end

  describe 'score_art' do
    it 'can score an array of art' do
      response = DummyClass.score_art(@u1.id)

      expect(response).to be_a(Hash)
      expect(response).to eq({@art6.id => 2.6, @art7.id => 1.6, @art8.id => 5.1})
    end
  end

  describe 'recommend' do
    xit 'can recommend art' do
      response = DummyClass.recommend(@u1.id, 1)

      expect(response).to eq([@art8])
    end
  end
end
