class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  # has_many :favorites
  has_many :recipes
  has_many :comments
end
