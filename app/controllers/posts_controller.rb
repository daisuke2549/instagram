class PostsController < ApplicationController
    def index
      @posts = Post.all
      @post = Post.new
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.create(post_params)
      @post = Post.create params.require(:post).permit(:content, :image)
      if @post.save
        redirect_back(fallback_location: root_path)
      else
        redirect_back(fallback_location: root_path)
      redirect_to "post_path"
      end
    end

    def show
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])
      @post.update params.require(:post).permit(:content,:image) # POINT
      redirect_to @post
    end

    private
    def post_params
      params.require(:post).permit(
      :subscribed,
      :content,
      :image
    )
    end
end
