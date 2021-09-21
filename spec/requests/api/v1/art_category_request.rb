require 'rails_helper'

RSpec.describe 'ArtCategory' do
  before :each do
    art = create(:art)
    category = create(:category)
    post "/api/v1/art_categories", params: {art_id: "#{art.id}", category_id: "#{category.id}"} #, category: "#{category.name}"}
  end

  it 'can create on the art_category table' do
    require "pry"; binding.pry
    expect(ArtCategory.count).to eq(1)
  end
end
