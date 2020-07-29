class SessionsController < ApplicationController

  def new
  end

  def create
    puts params[:email]
    user = User.authenticate_with_credentials(params[:email], params[:password])
    if user
       session[:user_id] = user.id
       redirect_to '/', notice: 'Logged in successfully'
    else
       redirect_to '/signup', :flash => { :notice => "Error loggin in" }
    end
  end

  
    def destroy
      session.delete(:user_id)
      redirect_to '/login', :flash => { :notice => "User has been logged out" }
    end
end