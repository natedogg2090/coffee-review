class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      user = User.find_or_create_by_omniauth(auth_hash)
    else
      user = User.find_by(:name => params[:user_name])
    end

    session[:user_id] = user.id
    
    redirect_to user_path(user)
  end

  def destroy
    session.delete(:user_id)

    redirect_to roasts_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
