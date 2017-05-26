class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, uniqueness: true
  validates :name, presence: true

  def self.most_popular
    #arel to find recipe that has been saved several times, limit 3
  end
end
