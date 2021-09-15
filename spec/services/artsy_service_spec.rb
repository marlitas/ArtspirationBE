require 'rails_helper'

RSpec.describe ArtsyService do
  describe 'Random sample of art work' do
    it 'exposes artwork api' do
      response = ArtsyService.call_db
      expect(response).to be_an(Array)
    end
  end
end