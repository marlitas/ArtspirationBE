class Api::V1::ArtsController < ApplicationController
  def create
    binding.pry
    art = Art.find_or_create_by(art_params)
    render json: ArtSerializer.new(art)
  end

  private

  def art_params
    params.permit(:artsy_id)
  end
end