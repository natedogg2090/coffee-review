class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(:name => params[:user][:name], :money => params[:user][:money], :prep_pref => params[:user][:prep_pref])
    user.save

    redirect_to user_path(user)
  end

  def show
    @user = User.find_by(:id => params[:id])
  end
end
