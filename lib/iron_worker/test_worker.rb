# iron worker queue callback
uri = URI.parse('http://crm-2000.herokuapp.com/api/sms_notifications')
puts uri.to_s
response = Net::HTTP.post_form(uri, params.slice('sms_notification', 'application_token'))
puts response.body
puts '----'
