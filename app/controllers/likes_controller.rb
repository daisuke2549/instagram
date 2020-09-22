class LikesController < ApplicationController
  before_action :authenticate_account!


  def create
    binding.pry
    post = Post.find(params[:post_id])
    post.likes.create!(account_id: current_account.id)
    redirect_to post_path(@post)
  end

  def destroy
    post = Post.find(params[:post_id])
    like = post.likes.find_by!(account_id: current_account.id)

    like.destroy!
    redirect_to post_path(post)
  end
  private
  def post_params
      params.require(:post).permit(:name, :content, :image)
  end
  def set_post
      @post = Post.find(params[:id])
  end
end