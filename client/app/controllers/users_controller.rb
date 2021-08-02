class UsersController < ApplicationController
  def profile
    is_authenticated?
    @user = current_user
  end

  def update
    if params.has_key?(:edit_user)
      @user = current_user
      params.permit!
      if @user.update_attribute(:phone_number, params[:edit_user][:phone_number]) && @user.update_attribute(:username, params[:edit_user][:username])
        flash[:notice] = "User updated successfully"
        current_user = @user
        redirect_to "/user/profile/"
      end
    end
  end

  def password
    @user = current_user
    if params.has_key?(:edit_password)
      if params[:edit_password][:password] == params[:edit_password][:password_confirmation]
        @user.update_attribute(:password, params[:edit_password][:password])
        flash[:notice] = "Your password has been changed"
        current_user = @user
      else
        flash[:error] = "New password and Confirmation password do not match"
      end
      redirect_to "/user/profile/"
    end
    # redirect_to "/user/profile/"
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

  def user_update_params
    params.permit(:username, :phone_number)
  end

  def is_authenticated?
    if !logged_in?
      flash[:error] = "You Need to Login First to Perform This Action"
      redirect_to '/login'
    end
  end
end
