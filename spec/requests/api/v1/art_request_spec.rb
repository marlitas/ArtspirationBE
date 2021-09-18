require 'rails_helper'

RSpec.describe 'Art Api' do
  describe 'Art Create' do
    it 'can create on the art table' do
      post "/api/v1/arts", params: {
        artsy_id: '1234'
      }
  
      new_art = JSON.parse(response.body, symbolize_names: true)
      expect(Art.last.artsy_id).to eq(1234)
    end
  end
end