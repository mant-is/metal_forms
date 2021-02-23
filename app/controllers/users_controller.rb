class UsersController < ApplicationController

  def create
    @user = User.new(username: params[:user][:username], email: params[:user][:email], password: params[:user][:password])
    redirect_to new_user_path and return if @user.save
    flash.now[:alert] = "#{@user.errors.full_messages}"
    render :new
  end

end
