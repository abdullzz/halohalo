class UsersController < ApplicationController
  def profile
    is_authenticated?
  end

  def dashboard
    is_authenticated?
  end

  def register
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created successfully"
      redirect_to root_path
    else
      render 'register'
    end
  end

  def user_params
    params.require(:user).permit(:username, :phone_number, :password)
  end

  def is_authenticated?
    if !logged_in?
      flash[:error] = "You Need to Login First to Perform This Action"
      redirect_to '/login'
    end
  end
end
