class PostsController < ApplicationController
    def index
      @posts = Post.all
    end






    def set_post
      @posts = Post.find(params[:id])
    end
end
