class User < ApplicationRecord
  has_many :recipes
  has_many :comments
  has_many :favorites
  has_many :ingredients, through: :recipes

  validates :name, uniqueness: true
  validates :name, presence: true
  validates :password, length: { minimum: 6 }

  has_secure_password

  def admin?
    #does this work?
    admin
  end

  def edit?(model)
    self == model.user || admin?
  end

  def delete?(model)
    case model
    when User || Recipe || Ingredient
      admin?
    when Comment
      edit?
    end
  end
end
