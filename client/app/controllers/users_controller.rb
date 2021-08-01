class UsersController < ApplicationController
  def profile
  end

  def dashboard
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
end
