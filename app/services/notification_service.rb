class NotificationService
  attr_reader :queue

  def initialize(user_ids)
    @recipients = User.where(:_id.in => user_ids).map &:phone
    @queue = client.queue 'notifications'
  end

  def send(message)
    body = { message: message, to: @recipients }.to_s
    @queue.post body
  end

  def client
    @client ||= IronMQ::Client.new token: ENV['IRON_TOKEN'],
        project_id: ENV['IRON_PROJECT_ID']
  end
end
