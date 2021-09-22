class Api::V1::RatedArtsController < ApplicationController

  def show
    art = Art.find(params[:art_id])
    user = User.find(params[:user_id])
    artwork = ArtsyFacade.find_art_by_id(art.artsy_id)
    rated_art = user.rated_arts.where('art_id =?', params[:art_id]).first
    render json: ArtSerializer.art_show(artwork, rated_art)
  end

  def index
    user = User.find(params[:user_id])
    liked_arts = user.rated_arts.where(liked: true)
    render json: ArtSerializer.rated_art(liked_arts, user)
  end

  def update
    rated_art = RatedArt.find_by(art_id: params[:art_id], user_id: params[:user_id])
    if rated_art
      rated_art = rated_art.update(rated_art_params)
    else
      rated_art = RatedArt.create(rated_art_params)
    end
    art = Art.find(params[:art_id])
    art_data = ArtsyFacade.find_art_by_id(art.artsy_id)
    render json: ArtSerializer.art_show(art_data, rated_art)
  end

  private

  def rated_art_params
    params.permit(:user_id, :art_id, :liked)
  end
end
