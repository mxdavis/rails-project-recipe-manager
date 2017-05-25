class User < ApplicationRecord
  has_many :recipes
  has_many :comments
  has_many :favorites
  has_many :ingredients, through: :recipes

  validates :name, uniqueness: true
  validates :password, length: { in: 6..20 }

  has_secure_password

  def admin?
    #does this work?
    admin
  end
end
