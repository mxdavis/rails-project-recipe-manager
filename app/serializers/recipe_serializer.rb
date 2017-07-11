class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :time_in_minutes, :instructions, :formatted_ingredients
  has_many :favorites, serializer: FavoriteSerializer
  belongs_to :user

  def formatted_ingredients
    object.recipe_ingredients.map do |ri|
      {
        quantity: ri.quantity,
        name: ri.ingredient.name
      }
    end
  end
end
