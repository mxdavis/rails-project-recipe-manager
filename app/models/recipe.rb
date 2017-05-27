class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :favorites
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, uniqueness: true
  validates :name, presence: true
  
  include ActionView::Helpers::TextHelper
  
  def user_name
    user.name
  end

  def self.newest(number = all.size)
    order("ID DESC").limit(number)
  end

  def self.fastest(number = all.size)
    order("time_in_minutes ASC").limit(number)
  end

  def favorite?(current_user)
   current_user && self.favorites.find_by(user_id: current_user.id)
  end

  def comments_size
    pluralize(comments.size, "Comment")
  end
end
