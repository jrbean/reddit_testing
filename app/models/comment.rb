class Comment < ActiveRecord::Base
  validates_presence_of :body, :user_id

  has_many :votes, as: :voteable
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  def vote_count
    uc = self.votes.where(status: true).count
    dc = self.votes.where(status: false).count
    uc - dc
  end
  
end
