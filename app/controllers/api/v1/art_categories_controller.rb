class Api::V1::ArtCategoriesController < ApplicationController
  def create
    art_category = ArtCategory.create(art_category_params)
    render status: 200
  end

  private

  def art_category_params
    params.permit(:art_id, :category_id)#, :category)
  end
end
