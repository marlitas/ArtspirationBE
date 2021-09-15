require 'rails_helper'

RSpec.describe ArtCategory, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:category_id) }
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:art_id) }
    it { should validate_presence_of(:art) }
  end

  describe 'relationships' do
    it { should belong_to(:category) }
    it { should belong_to(:art) }
  end
end
