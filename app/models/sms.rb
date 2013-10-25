module SMS
  def self.default
    SMS::PromoSMS::Gateway.new
  end
end
