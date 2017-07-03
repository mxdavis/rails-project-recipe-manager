class CommentSerializer < ActiveModel::Serializer
  attributes :id, :rating, :description
  belongs_to :user, serializer: UserSerializer
  belongs_to :recipe, serializer: RecipeSerializer
end
