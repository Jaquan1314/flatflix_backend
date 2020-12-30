class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :overview, :img
end
