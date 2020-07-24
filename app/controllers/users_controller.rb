class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/', notice: 'Account created successfully'
    else
      redirect_to '/signup', notice: "Error creating account"
    end
  end

private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end