class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      @user.save!
      session[:user_id] = @user.id
      redirect_to '/', :flash => { :notice => 'Account created successfully'}
    else
      redirect_to '/signup', :flash => { :notice => "Error creating account" }
    end
  end

private
  def user_params
    params.require(:user).permit(
      :first_name, 
      :last_name, 
      :email,
      :password, 
      :password_confirmation)
  end

end