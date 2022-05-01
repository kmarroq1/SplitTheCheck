class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :votes
  has_many :comments
  has_many :favorites

  def already_favorited?(restaurant)
    self.favorites.find(:all, :conditions => ['restaurant_id = ?', restaurant.id]).size > 0
  end
  
end
