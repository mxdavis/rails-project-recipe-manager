class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :time_in_minutes, :instructions
  belongs_to :user, serializer: UserSerializer
  # has_many :favorites
end
