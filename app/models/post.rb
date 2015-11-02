class Post < ActiveRecord::Base
  validates_presence_of :user_id, :title, :body

  belongs_to :user
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  def vote_count
    uc = self.votes.where(status: true).count
    dc = self.votes.where(status: false).count
    uc - dc
  end    

end
