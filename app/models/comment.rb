class Comment < ActiveRecord::Base
  validates_presence_of :body, :user_id

  has_many :votes, as: :voteable
  belongs_to :user
  belongs_to :commentable, polymorphic: true
end
