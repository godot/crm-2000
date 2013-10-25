# iron worker queue callback
require 'uri'
require 'net/http'

uri = URI.parse('http://crm-2000.herokuapp.com/api/sms_notifications')
puts uri.to_s
response = Net::HTTP.post_form(uri,
                                  'application_token' => 'token',
                                  'sms_notification[message]' => 'xxx',
                                  'sms_notification[to]' => '123456789' )
puts response.body
puts '----'
