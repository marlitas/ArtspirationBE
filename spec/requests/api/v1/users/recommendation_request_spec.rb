require 'rails_helper'
require './spec/facades/web_mock_stubs'

RSpec.describe 'Recommendations request' do
  before :each do
    Rails.cache.write("recommender_data", nil) if Rails.cache.fetch("recommender_data") != nil

    stub_request(:get, "localhost:3000/api/v1/users/:id/recommendations").to_return(status: 200, body: {
      'data': [
        {
        'id': '1',
        'type': 'artwork',
        'attributes': {
          'user_id': '1',
          'url': 'https://d32dm0rphc51dk.cloudfront.net/46PghnvIBjrN25-_kPPwQA/big_and_tall.jpg',
          'title': 'Campbells',
          'artist': 'Big Pharma',
          'artist_url': 'https://en.wikipedia.org/wiki/Vincent_van_Gogh',
          'liked': 'true'
        }
      },
        {'id': '2',
        'type': 'artwork',
        'attributes': {
          'user_id': '1',
          'url': 'https://d32dm0rphc51dk.cloudfront.net/46PghnvIBjrN25-_kPPwQA/big_and_tall.jpg',
          'title': 'Pharma',
          'artist': 'Big Campbell',
          'artist_url': 'https://en.wikipedia.org/wiki/Vincent_van_Dough',
          'liked': 'true'}}]}.to_json, headers: {} )

      stub_1 = WebmockStubs.mock_art

      stub_request(:get, "https://api.artsy.net/api/artworks?size=5").to_return(status: 200, body: WebmockStubs.mock_art, headers: {})

      stub_request(:post, "https://api.artsy.net/api/tokens/xapp_token").
      with(
        body: {"client_id"=>"3429ac42498f465efb3e", "client_secret"=>"7370bb88035545c70458ea97dd06a3c1"},
        headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'Content-Type'=>'application/x-www-form-urlencoded',
       'Host'=>'api.artsy.net',
       'User-Agent'=>'Ruby'
        }).
      to_return(status: 200, body: "".to_json, headers: {})

    GetArtFacade.show_me_art(5, 'large')

    @u1 =User.create(name: 'a', email:'a@a.com', token: '12345')
    @u2 =User.create(name: 'b', email:'b@a.com', token: '12346')
    @u3 =User.create(name: 'c', email:'c@a.com', token: '12347')
    @u4 =User.create(name: 'd', email:'d@a.com', token: '12348')
    @u5 =User.create(name: 'e', email:'e@a.com', token: '12349')
    @u1.rated_arts.create(liked: true, art_id:1)
    @u2.rated_arts.create(liked: true, art_id:2)
    @u3.rated_arts.create(liked: true, art_id:3)
    @u4.rated_arts.create(liked: true, art_id:4)
    @u5.rated_arts.create(liked: true, art_id:5)
    @u1.rated_arts.create(liked: false, art_id:5)
    @u2.rated_arts.create(liked: false, art_id:1)
    @u3.rated_arts.create(liked: false, art_id:3)
    @u4.rated_arts.create(liked: false, art_id:2)
    @u5.rated_arts.create(liked: false, art_id:1)
    #performs update for each rating
    RatedArt.all.each do |rated|
      RecommenderService.update_recommender_data(rated)
    end
  end

  it 'can send recommended art' do
    create(:user)

    get "/api/v1/users/#{User.first.id}/recommendations"


  end
end
