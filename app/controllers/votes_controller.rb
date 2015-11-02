class VotesController < ApplicationController
  def create
    thing = Post.find_by_id(params[:post_id])

    if params[:status]
      current_user.upvote thing
    else
      current_user.downvote thing
    end

    if vote.save
      redirect_to :back
    end
  end

  def destroy
  end

  def edit
  end
end
