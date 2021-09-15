require 'rails_helper'

RSpec.describe RatedArt, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:art) }
  end
end
