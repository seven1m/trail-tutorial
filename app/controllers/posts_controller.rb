class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc).all
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to action: :index
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to action: :index
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
