class Member
  include Mongoid::Document

  field :email
  field :name
  field :phone

  validates :name, presence: true
  validates :phone, uniqueness: true, allow_nil: true
end
