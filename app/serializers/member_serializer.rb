class MemberSerializer < ActiveModel::Serializer
  self.root = false
  attributes :id, :name, :phone, :email

  def id
    object.id.to_s
  end
end
