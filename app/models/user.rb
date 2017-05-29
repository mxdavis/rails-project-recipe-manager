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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
  
  def admin?
    admin
  end

  def can_edit?(class_type)
    if class_type.is_a?(User)
      self == class_type || admin?
    else
      self == class_type.user || admin?
    end
  end

  def can_delete?(class_type)
    case class_type
    when User
      admin?
    when Recipe
      admin?
    when Ingredient
      admin?
    when Comment
      can_edit?(class_type)
    end
  end

  def owns?(id)
    self.id == id.to_i
  end

  private

  def already_has_password?
    !self.password_digest.blank?
  end
end
