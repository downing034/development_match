class ProfilesController < ApplicationController
  def new
    # form where a user can fill out their own profile
    # code below helps the program find that particular user that is logged in.
    @user = User.find(params[:user_id] )
    @profile = @user.build_profile
  end
  
  def create
  end

  def update
  end
end