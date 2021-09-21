class Api::V1::RatedArtsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    liked_arts = user.rated_arts.where(liked: true)
    artworks = []
    liked_arts.each do |liked_art|
      serialized_hash = {}
      art_data = ArtsyFacade.find_art_by_id(liked_art.art.artsy_id)
      serialized_hash = {}
      serialized_hash[:id] = liked_art.art_id
      serialized_hash[:type] = 'liked_art'
      attrs = {}
      attrs[:title] = art_data[:title]
      attrs[:image] = art_data[:_links][:image][:href]
      attrs[:user_id] = user.id
      serialized_hash[:attributes] = attrs
      artworks << serialized_hash
    end
    render json: {data: artworks}
  end
end
