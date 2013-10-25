class Api::SmsNotificationsController < ApplicationController
  before_filter :authenticate_requester!

  def create
    if message_delivered?
      render json: { success: 'success' }
    else
      render json: { success: 'failed' }
    end
  end

  private
  def authenticate_requester!
    if not_allowed?
      render :json=> {:success=>false, :message=>'not-allowed'}, :status=>401
    end
  end

  def not_allowed?
    params[:application_token] != ENV['APPLICATION_TOKEN']
  end

  def send_message
    SMS::default.send(params[:sms_notification][:message], params[:sms_notification][:to])
  end

  def message_delivered?
    result = send_message

    result.include? 'Status: 001'
  end
end
