class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :recipe_id, :user_id
  belongs_to :user
  belongs_to :recipe
end
