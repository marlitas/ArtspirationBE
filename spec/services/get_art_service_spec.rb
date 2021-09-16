require 'rails_helper'

RSpec.describe GetArtService do
  describe 'Random sample of art work' do
    it 'exposes artwork api' do
      response = GetArtService.call_db
      art_data = response[:_embedded][:artworks]
      
      expect(response).to be_a(Hash)
      expect(art_data).to be_a(Array)
    end
  end
end