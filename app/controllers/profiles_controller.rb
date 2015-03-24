class ProfilesController < ApplicationController
  def new
    # form where a user can fill out their own profile
    # code below helps the program find that particular user that is logged in.
    @user = User.find(params[:user_id] )
    @profile = @user.build_profile
  end
  
  def create
    @user = User.find(params[:user_id] )
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Profile Updated!"
      redirect_to user_path params[:user_id]
    else
      flash[:error] = "Profile did not save."
      render action: :new
    end
  end

  def update
  end
  
  private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
  end
end