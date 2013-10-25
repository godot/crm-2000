class Api::InfoController < ApplicationController
  skip_before_action :authenticate!

  def index
    respond_with status
  end

  private
  def status
    {
      application: 'crm 2000',
      version: '0.0.1'
    }
  end
end
