class Comment < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  
  validates :rating, :inclusion => { :in => 1..5 }, :message => "Your rating must be between 1 and 5"
end
