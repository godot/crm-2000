class User
  include Mongoid::Document
  include TokenAuthenticatable

  devise :database_authenticatable, :registerable, :validatable

  field :phone
  field :email
  field :encrypted_password
  field :authentication_token

  validates_presence_of :phone

  def email_required?
    false
  end
end
