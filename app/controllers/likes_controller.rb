class LikesController < ApplicationController
<<<<<<< HEAD
  before_action :authenticate_account!
=======
    before_action :authenticate_account!
 
    def create
      post = Post.find(params[:post_id])
      post.likes.create!(account_id: current_account.id)
      redirect_to post_path(post)
    end
>>>>>>> master

  def create
    post = Post.find(params[:post_id])
    post.likes.create!(account_id: current_account.id)
    redirect_to article_path(post)

  def destroy
    post = Post.find(params[:post_id])
    like = post.likes.find_by!(accounr_id: current_account.id)

    like.destroy!
    redirect_to article_path(article)
  end
  end
end