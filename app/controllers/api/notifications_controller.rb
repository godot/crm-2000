class Api::NotificationsController < ApplicationController
  def create
    NotificationService.new(params[:user_ids]).send params[:message]
    render json: { status: :ok }
  end
end
