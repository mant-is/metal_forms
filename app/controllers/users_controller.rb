class UsersController < ApplicationController

  def create
    # @user = User.new(username: params[:user][:username], email: params[:user][:email], password: params[:user][:password])
    @user = User.new(user_params)
    redirect_to new_user_path and return if @user.save
    flash.now[:alert] = "#{@user.errors.full_messages}"
    render :new
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

end
