class Restaurant < ApplicationRecord
  has_many :votes
  has_many :comments
  has_many :favorites

end
