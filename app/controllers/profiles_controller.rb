class ProfilesController < ApplicationController
    def index
        @profiles = Post.all
        @profile = Post.new
    end
    def new
        @profile = Profile.new
      end
  
      def create
        @profile = Profile.create(post_params)
        @profile.image = "Ellipse.png"
        @profile = Profile.create params.require(:profile).permit(:image)
        if @profile.save
          redirect_back(fallback_location: profiles_path)
        else
          redirect_back(fallback_location: profiles_path)
        end
      end
     
      def update
        @profile = Profile.find(params[:id])
        @profile.update params.require(:profile).permit(:image)
      end

      private
      def post_params
        params.require(:profile).permit( :image
      )
      end

      def set_post
        @profile = Profile.find(params[:id])
      end


end
