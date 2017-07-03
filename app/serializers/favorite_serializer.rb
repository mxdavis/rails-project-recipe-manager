class FavoriteSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :user, serializer: UserSerializer
  belongs_to :recipe, serializer: RecipeSerializer

  url [:recipe, :user, :favorite]
end
