class VotesController < ApplicationController
  def create
    thing = Post.find_by_id(params[:post_id])

    if params[:status] == true
      current_user.upvote thing
    elsif params[:status] == false
      current_user.downvote thing
    end
      redirect_to :back
  end


end
