class User
  include Mongoid::Document
  include TokenAuthenticatable

  devise :database_authenticatable, :registerable, :validatable

  field :email
  field :encrypted_password
  field :authentication_token
end
