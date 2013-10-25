class UserSerializer < ActiveModel::Serializer
  attributes :phone, :email, :authentication_token
end
