class UsersController < ApplicationController
  before_action :ensure_site_unlocked

  def new
    @user = User.new
  end

  def create
  	@user = User.first_or_create(user_params)
  	@user.set_default_name
  	if @user.save
  	  UserMailer.setup_instructions(@user).deliver
  	  flash[:success] = "Email with instruction sent"
  	  redirect_to new_user_path
  	else
  	  flash.now[:error] = "There was a problem with the user"
  	  render 'new'
  	end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end  

end  	    