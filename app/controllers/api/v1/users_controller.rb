class Api::V1::UsersController < ApplicationController

  def index
  end

  def show
    user = User.find(params[:id])
    render json: UserSerializer.new(user)
  end

  def create
    user = User.find_or_create_by(user_params)
    render json: UserSerializer.new(user)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email) #, :token)
  end
end
