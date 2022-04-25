class Restaurant < ApplicationRecord
  has_many :votes
  has_many :comments

  def add_comment(user_id, comment)
    @comment = Comment.new(restaurant_id:self.id, user_id:user_id, comment:comment)
    @comment.save
  end
end
