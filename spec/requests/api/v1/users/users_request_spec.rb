require 'rails_helper'

RSpec.describe 'Users API' do
  describe 'POST /api/v1/users' do
    let(:valid_attributes) { { name: 'Funbucket', email: 'Email@email.com', token: '?'} }
    headers = { "CONTENT_TYPE" => "application/json"}

    before :each do
      post '/api/v1/users', headers: headers, params: JSON.generate({user: valid_attributes})
    end

    describe 'can create and delete a user' do

      it 'can create a user' do
        body = "{\"data\":
                    {\"id\":\"1\",
                      \"type\":\"user\",
                      \"attributes\":{
                                      \"name\":\"Funbucket\",
                                      \"email\":\"Email@email.com\",
                                      \"token\":\"?\"}}}"
        # ^ only here to show response.body
        expect(response).to be_successful

        created_user = User.last

        expect(created_user.email).to eq(valid_attributes[:email])
        expect(created_user.name).to eq(valid_attributes[:name])
      end

      it 'will send an error message if an account has already been created' do
        valid_attributes = { name: 'Funbucket2', email: 'Email@email.com', token: '?'}
        headers = { "CONTENT_TYPE" => "application/json"}

        post '/api/v1/users', headers: headers, params: JSON.generate({user: valid_attributes})

        expect(response).to_not be_successful
        expect(response.status).to eq(400)
      end

      it 'can delete a user' do
        expect(User.count).to eq(1)

        user = User.last

        delete "/api/v1/users/#{User.last.id}"

        expect(response).to be_successful
        expect(User.count).to eq(0)
        expect{User.find(user.id)}.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
