module SMS
  module PromoSMS
    class Gateway
      attr_reader :login, :password

      def send message, to
        connection.get do |req|
          req.url '/remote/http/send.php'
          req.params['login'] = login
          req.params['password'] = password
          req.params['msg'] = message
          req.params['to']  = to.join(',')
        end
      end

      private
      def connection
        @connection ||= Faraday.new(url: ENV['PROMOSMS_URL'])
      end

      def login
        ENV['PROMOSMS_LOGIN']
      end

      def password
        ENV['PROMOSMS_PASSWORD']
      end
    end
  end
end
