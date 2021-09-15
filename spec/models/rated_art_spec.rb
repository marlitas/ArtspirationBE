require 'rails_helper'

RSpec.describe RatedArt, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:liked) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:art_id) }
    it { should validate_presence_of(:art) }
  end

  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:art) }
  end
end
