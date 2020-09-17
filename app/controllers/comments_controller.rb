class CommentsController < ApplicationController
  def new
    post = Post.find(params[:post_id])
    @comment = post.comments.build
  end

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(post), notice: 'コメントを追加'
    else
      flash.now[:error] = '更新できませんでした'
      render :new
    end
  end

  def show
    @comments = @post.comments
  end

  def edit
  end

  def update
  end

  def destroy
    @comment.destroy!
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end
