require 'rails_helper'
require_relative './web_mock_stub' 

RSpec.describe GetArtService do
  describe 'Random sample of art work' do
    it 'exposes artwork api', :vcr do
      number = 10
      size = 'large'

      response = GetArtService.artwork_sample(number, size)
      art_data = response[:_embedded][:artworks]
      expect(response).to be_a(Hash)
      expect(art_data).to be_a(Array)
    end
  end
end