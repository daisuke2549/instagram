class PostsController < ApplicationController
    def index
      @posts = Post.all
      @post = Post.new
    end

    def new
      @post = Post.new
    end
  

    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_back(fallback_location: root_path)
      else
        redirect_back(fallback_location: root_path)
      end
    end

    private
    def post_params
      params.require(:post).permit(
      :content,
      :img
    )
    end
end
