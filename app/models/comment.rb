class Comment < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  validates :rating, inclusion: { in: %w(1 2 3 4 5), message: "is between 1-5"}
end
