require 'rails_helper'

RSpec.describe 'Category' do
  it 'can create on the category table' do
    post "/api/v1/categories", params: {
      name: 'water colors'
    }

    expect(Category.first.name).to eq('water colors')

    post "/api/v1/categories", params: {
      name: 'water colors'
    }
    
    expect(Category.count).to eq(1)
  end
end