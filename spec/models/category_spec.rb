require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
  
  describe 'relationships' do
    it { should have_many(:art_categories) }
    it { should have_many(:arts).through(:art_categories) }
  end
end
