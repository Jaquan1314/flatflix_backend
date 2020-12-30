class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :overview, :img
  # has_many :favorites
  has_many :users, through: :favorites
end
