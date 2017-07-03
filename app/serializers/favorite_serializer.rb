class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :recipe_id, :user_id
  # belongs_to :user, serializer: UserSerializer
  # belongs_to :recipe, serializer: RecipeSerializer
end
