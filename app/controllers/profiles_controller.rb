class ProfilesController < ApplicationController
     before_action :authenticate_account!
    def show
        @profile = current_account.profile
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

      def edit
        @profile = current_account.prepare_profile
      end

      def update
        @profile = current_account.build_profile(profile_params)
        if @profile.save
          redirect_to profile_path, notice: 'プロフィール更新！'
        else
          flash.now[:error] = '更新できませんでした'
          render :edit
        end
      end

      def index
      end
  
private
   def profile_params
    params.require(:profile).permit(
      :nickname,
      :introduction,
      :gender,
      :birthday,
      :image
    )
   end

end
