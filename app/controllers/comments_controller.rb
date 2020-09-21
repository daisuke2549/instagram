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
   @comment = current_account.comments.create(comment_params)
   if @comment.save
     flash[:success] = "コメントが投稿されました！"
     redirect_to root_path
   else
     flash[:alert] = "コメントの投稿に失敗しました。"
     redirect_to root_path
   end
  end




  private
  def comment_params
    params.require(:comment).permit(:content, :account_id)
  end
end