class Post < ActiveRecord::Base
  validate_presence_of :user_id, :title, :body

  belongs_to :user
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
end
