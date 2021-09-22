class Api::V1::RatedArtsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    liked_arts = user.rated_arts.where(liked: true)
    render json: Art.serialize_art(liked_arts, 'liked_art')
  end
end
