require 'rails_helper'

RSpec.describe ArtCategory, type: :model do
  describe 'relationships' do
    it { should belong_to(:category) }
    it { should belong_to(:art) }
  end
end
