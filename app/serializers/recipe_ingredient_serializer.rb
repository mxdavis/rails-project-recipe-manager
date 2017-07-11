class RecipeIngredientSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :ingredient_id
  belongs_to :ingredient, serializer: IngredientSerializer
  belongs_to :recipe, serializer: RecipeSerializer
  has_many :comments, serializer:CommentSerializer
end
