require 'rails_helper'

RSpec.describe LikedArt, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:art) }
  end
end
