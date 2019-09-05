class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]
  before_action :set_user, only: [:index, :show]

  def index
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
    @purchases = Purchase.purchased_by(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :money, :admin)
  end

  def set_user
    @user = find_user(session[:user_id])
  end

end