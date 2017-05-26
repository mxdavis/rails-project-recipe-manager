class User < ApplicationRecord
  has_many :recipes
  has_many :comments
  has_many :favorites
  has_many :ingredients, through: :recipes

  validates :name, uniqueness: true
  validates :name, presence: true

  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { minimum: 6 },
                       :unless => :already_has_password?

  has_secure_password

  def admin?
    admin
  end

  def edit?(class_type)
    if class_type.is_a?(User)
      self == class_type || admin?
    else
      self == class_type.user || admin?
    end
  end

  def delete?(class_type)
    case class_type
    when User || Recipe || Ingredient
      admin?
    when Comment
      edit?
    end
  end

  private

  def already_has_password?
    !self.password_digest.blank?
  end
end
