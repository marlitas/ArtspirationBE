class Api::V1::UsersController < ApplicationController

  def index
  end

  def show
  end

  def create
    # if User.find_by(email: params[:email]) != nil
    #   render json: {error: "Account already created.", status: :bad_request}
    # else
      user = User.create!(user_params)
      render json: UserSerializer.new(user)
    # end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :token)
  end
end
