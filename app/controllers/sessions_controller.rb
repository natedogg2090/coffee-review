class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
  end

  def create

    user = User.find_by(:name => params[:user_name])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render 'new'
    end
  end

  def facebook_login
    if auth_hash.present?
      user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render 'new'
    end

  end

  def destroy
    session.delete(:user_id)

    redirect_to roasts_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

end
