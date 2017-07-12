class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :time_in_minutes, :instructions, :formatted_ingredients, :formatted_comments
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

  def formatted_comments
    object.comments.map do |c|
      {
        rating: c.rating,
        description: c.description,
        userName: c.user.name,
        userId: c.user.id
      }
    end
  end
end
