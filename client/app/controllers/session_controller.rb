class SessionController < ApplicationController
  # def login
  #   @user = User.find_by(username: params[:username])
  
  #   if !!@user && @user.authenticate(params[:password])
  #     session[:user_id] = @user.id
  #     redirect_to root_path
  #   else
  #     message = "Something went wrong, make sure your username and password are correct"
  #     # redirect to root_path, notice: message
  #   end
  # end
  # def register
  #   @user = User.new
  # end
  def login
    if logged_in?
      redirect_back(fallback_location: '/user/dashboard')
    end
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully."
      redirect_to "/user/dashboard"
    else
      flash.now[:alert] = "Check Your Username and Password"
      render 'login'
    end
  end
   
  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_path
  end  
end
