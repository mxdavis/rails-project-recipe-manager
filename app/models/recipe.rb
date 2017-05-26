class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, uniqueness: true
  validates :name, presence: true
  
  def user_name
    user.name
  end

  def self.newest(number = all.size)
    order("ID DESC").limit(number)
  end
end
