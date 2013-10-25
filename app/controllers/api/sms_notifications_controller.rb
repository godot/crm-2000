class Api::SmsNotificationsController < ApplicationController
  before_filter :authenticate_requester!
  skip_before_filter :authenticate!
  skip_before_action :verify_authenticity_token

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
    if params[:sms_notification].is_a? String
      params[:sms_notification] = JSON.parse(params[:sms_notification])
    end
    SMS::default.send(params[:sms_notification][:message], params[:sms_notification][:to])
  end

  def message_delivered?
    result = send_message

    result.include? 'Status: 001'
  end
end
