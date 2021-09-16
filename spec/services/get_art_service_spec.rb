require 'rails_helper'

RSpec.describe GetArtService do
  describe 'Random sample of art work' do
    it 'exposes artwork api' do
      number = 100
      size = 'large'
      response = GetArtService.artwork_sample(number, size)
      art_data = response[:_embedded][:artworks]

      expect(response).to be_a(Hash)
      expect(art_data).to be_a(Array)
    end
  end
end
