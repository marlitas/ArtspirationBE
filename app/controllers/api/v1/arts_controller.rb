class Api::V1::ArtsController < ApplicationController
  def create
    art = Art.create(art_params)
    render json: ArtSerializer.new(art)
  end

  private

  def art_params
    params.permit(:artsy_id)
  end
end