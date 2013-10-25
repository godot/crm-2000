class Api::UsersController < ApplicationController
  skip_before_action :authenticate!

  def create
    user = User.create! user_params
    user.reset_authentication_token!

    render json: user
  end

  private

  def user_params
    params.require(:user).permit :phone, :email, :password
  end
end
