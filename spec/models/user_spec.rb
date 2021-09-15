require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:liked_arts) }
    it { should have_many(:arts).through(:liked_arts) }
  end
end
