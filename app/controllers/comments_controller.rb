class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.create!(comment_params)
    redirect_to Post.find params[:post_id]
  end

  def new
    @post = Post.find params[:post_id]
    @comment = Comment.new
  end

  def destroy
    @comment = Comment.find params[:id]
  end

  def edit
    @comment = Comment.find params[:id]
  end

  def show
    @comment = Comment.find params[:id]
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :commentable_type, :post_id)
    end

end
