class Restaurant < ApplicationRecord
  has_many :votes
  has_many :comments

end
