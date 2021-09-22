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
  end

  describe 'user_liked_categories' do
    it 'can find categories a user has liked' do
      response = DummyClass.user_liked_categories(@u1.id)

      expect(response.length).to eq(12)
      expect(response.first.category_id).to eq(@cat1.id)
      expect(response.last.category_id).to eq(@cat7.id)
    end

    it 'can find categories related to specific art' do
      response = DummyClass.art_categories(@art1.id)

      expect(response.length).to eq(3)
      expect(response.first.category_id).to eq(@cat1.id)
      expect(response.last.category_id).to eq(@cat3.id)
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
end
