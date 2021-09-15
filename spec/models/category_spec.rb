require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'relationships' do
    it { should have_many(:art_categories) }
    it { should have_many(:arts).through(:art_categories) }
  end
end
