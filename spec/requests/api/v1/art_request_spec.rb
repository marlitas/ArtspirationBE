require 'rails_helper'

RSpec.describe 'Art Api' do
  describe 'Art Create' do
    before(:each) do
      post "/api/v1/arts", params: {
        artsy_id: '1234'
      }
    end

    it 'can create on the art table' do
      new_art = JSON.parse(response.body, symbolize_names: true)
      expect(Art.last.artsy_id).to eq(1234)
    end
    
    it 'Can create multiple categories' do
      post "/api/v1/arts", params: {
        artsy_id: '4321'
      }
      expect(Art.count).to eq(2)
    end 

    it 'Sad Path cannot create duplicate categories' do
      post "/api/v1/arts", params: {
        artsy_id: '1234'
      }
      expect(Art.count).to eq(1)
    end
  end
end