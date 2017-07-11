class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :favorites, serializer: FavoriteSerializer
  has_many :recipes, serializer: RecipeSerializer
  has_many :comments, serializer:CommentSerializer
end
