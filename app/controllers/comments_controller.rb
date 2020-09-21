class CommentsController < ApplicationController

  def new
    post = Post.find(params[:post_id])
    @comment = post.comments.build
  end

 def index
 end


  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comment_params)
    @comment.save!
    render json: @comment
  end

  def destroy
    @comment.destroy
    flash[:success] = "コメントが削除されました"
    redirect_to request.referrer || root_url
  end
 


  private
  def comment_params
    params.require(:comment).permit(:content, :account_id)
  end
end