class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]

  def index
    @user = find_user(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
    end

    redirect_to user_path(user)
  end

  def show
    @user = find_user(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :money, :admin)
  end

end
