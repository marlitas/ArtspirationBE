class Api::V1::RatedArtsController < ApplicationController

  def show
    art = Art.find(params[:id])
    user = User.find(params[:user_id])
    artwork = ArtsyFacade.find_art_by_id(art.artsy_id)
    rated_art = user.rated_arts.where('art_id =?', params[:id]).first
    render json: ArtSerializer.art_show(artwork, rated_art)
  end

  def index
    user = User.find(params[:user_id])
    liked_arts = user.rated_arts.where(liked: true)
    render json: Art.serialize_art(liked_arts, 'liked_art')
  end
end
