class Api::V1::RecommendationsController < ApplicationController

  def index
    user = User.find(params[:user_id])
    type = 'recommended_art'
    recommended_arts = RecommenderService.recommend_art(user.id, 1)
    artworks = []
    #If we send multiple options for art recommendation to frontend, must limit API call with sleep 0.2 in each below.
    recommended_arts.each do |art|
      art_data = ArtsyFacade.find_art_by_id(art.artsy_id)
      serialized_hash = {}
      serialized_hash[:id] = art.id
      serialized_hash[:type] = type
      attrs = {}
      attrs[:title] = art_data[:title]
      attrs[:image] = art_data[:_links][:image][:href].gsub('{image_version}', 'medium')
      attrs[:user_id] = user.id
      serialized_hash[:attributes] = attrs
      artworks << serialized_hash
    end
    render json: {data: artworks}.to_json
  end
end
