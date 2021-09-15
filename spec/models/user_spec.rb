require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:rated_arts) }
    it { should have_many(:arts).through(:rated_arts) }
  end
end
