require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    #it { should validate_presence_of(:token) }
  end

  describe 'relationships' do
    it { should have_many(:rated_arts) }
    it { should have_many(:arts).through(:rated_arts) }
  end
end
