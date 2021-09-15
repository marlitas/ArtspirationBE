require 'rails_helper'

RSpec.describe Art, type: :model do
  describe 'relationships' do
    it { should have_many(:rated_arts) }
    it { should have_many(:users).through(:rated_arts) }
    it { should have_many(:art_categories) }
    it { should have_many(:categories).through(:art_categories) }
  end
end
