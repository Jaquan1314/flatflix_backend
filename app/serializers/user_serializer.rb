class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :password
  has_many :favorites
end
