class Api::V1::RecommendationsController < ApplicationController

  def index
    user = User.find(params[:user_id])
    type = 'recommended_art'
    recommended_arts = RecommenderService.recommend_art(user.id)
    user_recommended_art = []
    recommended_arts.each do |art|
      user_recommended_art << Art.find_by(id: art[:item_id])
    end
    artworks = []
    user_recommended_art.each do |art|
      art_data = ArtsyFacade.find_art_by_id(art.artsy_id)
      serialized_hash = {}
      serialized_hash[:id] = art.id
      serialized_hash[:type] = type
      attrs = {}
      attrs[:title] = art_data[:title]
      attrs[:image] = art_data[:_links][:image][:href]
      attrs[:user_id] = user.id
      serialized_hash[:attributes] = attrs
      artworks << serialized_hash
    end
    render json: {data: artworks}.to_json
  end
end
