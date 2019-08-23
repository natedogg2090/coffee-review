class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :show]

  def index
    if logged_in?
      @user = User.find_by(:id => session[:user_id])
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.save

    redirect_to user_path(user)
  end

  def show
    @user = User.find_by(:id => params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :money, :admin)
  end
end
