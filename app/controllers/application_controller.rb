class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :authenticate!
  attr_reader :current_user

  def authenticate!
    authenticate_or_request_with_http_token do |token|
      @current_user = User.where(authentication_token: token).first
    end
  end

  rescue_from Mongoid::Errors::DocumentNotFound do
    render nothing: true, status: :not_found
  end
end
