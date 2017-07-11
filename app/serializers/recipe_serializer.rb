class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :time_in_minutes, :instructions
  has_many :favorites, serializer: FavoriteSerializer
  belongs_to :user
  has_many :recipe_ingredients, serializer: RecipeIngredientSerializer
  # has_many :ingredients, through: :recipe_ingredients
end
