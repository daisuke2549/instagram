class UnfollowsController < ApplicationController
    before_action :authenticate_account!
 
    def create
      current_acccount.unfollow!(params[:account_id])
      redirect_to account_path(params[:account_id])
    end
  end