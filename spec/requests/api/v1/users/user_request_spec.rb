require 'rails_helper'

RSpec.describe 'User Show API' do
  before :each do
    create_list(:user, 2)
  end

  describe 'GET /api/v1/users/#{user_id}' do
    it 'sends information about a particular user' do
      get "/api/v1/users/#{User.first.id}"

      expect(response).to be_successful

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user[:data].count).to eq(3)
      expect(user[:data]).to have_key(:id)
      expect(user[:data][:id]).to be_a(String)
      expect(user[:data][:attributes]).to have_key(:name)
      expect(user[:data][:attributes][:name]).to be_a(String)
      expect(user[:data][:attributes]).to have_key(:email)
      expect(user[:data][:attributes][:email]).to be_a(String)
      expect(user[:data][:attributes]).to have_key(:token)
      expect(user[:data][:attributes][:token]).to be_a(String)
    end

    it 'returns a 404 when a bad id(integer) is input' do
      get "/api/v1/users/123223223"

      expect(response.status).to eq(404)
    end

    it 'returns a 404 when an id is input as a string' do
      id = "1"
      get "/api/v1/users/#{id}"

      expect(response.status).to eq(404)
    end
  end
end
