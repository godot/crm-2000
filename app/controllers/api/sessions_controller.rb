class Api::SessionsController < ApplicationController
  skip_before_action :authenticate!, only: :create

  def create
    user = User.find_for_database_authentication phone: params[:user][:phone]

    return invalid_login_attempt unless user
    return invalid_login_attempt unless user.valid_password?(params[:user][:password])

    user.reset_authentication_token!

    render json: user
  end

  def destroy
    current_user.update_attribute :authentication_token, nil
    render json: { status: :ok }
  end

  private

  def invalid_login_attempt(message = 'Error with your login or password')
    warden.custom_failure!
    render json: { success: false, message: message }, status: 401
  end
end
