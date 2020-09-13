class ProfilesController < ApplicationController
    def index
        @profiles = Profile.all
        @profile = Profile.new
    end
    def show 
        @profile = Profile.find(params[:id])
      end
    def new
        @profile = Profile.new
      end
  
      def create
        @profile = Profile.create(profile_params)
        @profile = Profile.create params.require(:profile).permit(:image)
        if @profile.save
          redirect_back(fallback_location: profiles_path)
        else
          redirect_back(fallback_location: profiles_path)
        end
      end
  
      def show
        @profile = Profile.find(params[:id])
      end
  
      def update
        @profile = Profile.find(params[:id])
        @profile.update params.require(:profile).permit(:image) # POINT
        redirect_to @profile
      end
  
      private
      def profile_params
        params.require(:profile).permit(
        :image
      )
      end

end
