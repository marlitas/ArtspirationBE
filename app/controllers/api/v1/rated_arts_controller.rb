class Api::V1::RatedArtsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    liked_arts = user.rated_arts.where(liked: true)
    artworks = []
    # binding.pry
    liked_arts.each do |liked_art|
      art_data = ArtsyFacade.find_art_by_id(liked_art.art.artsy_id)
      artworks << ArtSerializer.new(art_data)
    end
    render json: artworks
  end
end
