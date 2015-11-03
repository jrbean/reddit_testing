class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :votes
  has_many :comments

  def upvote thing
    v = thing.votes.find_by(user: self)
    if v
      if (v.status == true)
        v.status = nil
      else
        v.status = true
      end
    else
      v = votes.new voteable: thing, status: true
    end
    v.save!
  end

  def downvote thing
    v = thing.votes.find_by(user: self)
    if v
      if (v.status == false)
        v.status = nil
      else
        v.status = false
      end
    else
      v = votes.new voteable: thing, status: false
    end
    v.save!
  end
end
