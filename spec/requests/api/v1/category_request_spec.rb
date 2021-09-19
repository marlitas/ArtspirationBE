require 'rails_helper'

RSpec.describe 'Category' do
  before(:each) do
    post "/api/v1/categories", params: {
      name: 'water colors'
    }
  end

  it 'can create on the category table' do
    expect(Category.first.name).to eq('water colors')
  end

  it 'Can create multiple categories' do
    post "/api/v1/categories", params: {
      name: 'Art'
    }

    expect(Category.count).to eq(2)
  end

  it 'Sad Path cannot create duplicate categories' do
    post "/api/v1/categories", params: {
      name: 'water colors'
    }
    
    expect(Category.count).to eq(1)
  end  
end