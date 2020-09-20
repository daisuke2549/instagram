class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  before_action :authenticate_account!, only: [:new, :create, :edit, :update, :destroy]
    def index
      @posts = Post.all
      @post = Post.new
    end

    def new
      @post = Post.new
      @post = current_account.posts.build
    end
  
    def create
      @post = current_account.posts.build(post_params)
      if @post.save!
          redirect_to posts_path(@post), notice: '保存できました'
        else
          flash.now[:error] = '保存に失敗しました'
          render :new
      end
  end

    def edit
      @post = current_account.posts.find(params[:id])
    end

    def show
      @post = Post.find(params[:id])
      @comments = @post.comments
    end

    def update
      @post = current_account.posts.find(params[:id])
      if @post.update(post_params)
        redirect_to post_path(@post), notice: '更新できました'
      else
       flash.now[:error] = '更新できませんでした'
       render :edit
     end
    end



    private
    def post_params
      params.require(:post).permit(
      :subscribed,
      :content,
      :image
    )
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
