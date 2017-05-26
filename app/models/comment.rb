class Comment < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  validates_inclusion_of :rating, :in => 1..5, message: "is between 1-5"

  def user_name
    user.name
  end

  def time
    created_at.strftime("%l:%M %P %B %e, %Y")
  end
end
