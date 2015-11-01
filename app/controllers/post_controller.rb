class PostController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.create!(post_params)
    redirect_to @post
  end

  def new
    @post = Post.new
  end

  def destroy
    @post = Post.find params[:id]
  end

  def edit
    @post = Post.find params[:id]
  end

  def show
    @post = Post.find params[:id]
  end

  private

    def post_params
      params.require(:post).permit(:body, :title)
    end
end
