class Api::V1::CategoriesController < ApplicationController
  def create
    category = Category.find_or_create_by(category_params)
   
    render status: 200
  end

  private

  def category_params
    params.permit(:name)
  end
end