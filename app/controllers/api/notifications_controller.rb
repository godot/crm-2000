class Api::NotificationsController < ApplicationController
  skip_before_filter :authenticate!
  skip_before_action :verify_authenticity_token

  def create
    #NotificationService.new(params[:user_ids]).send params[:message]

    @client ||= IronWorkerNG::Client.new(:token => 'HJ7xRkAFPyJqZw5KDTEgal-Ot3M', :project_id => '526a66b9d9c3480005000001')
    @client.tasks.create('test', params.slice('sms_notification'))

    render json: { status: :ok }
  end
end
