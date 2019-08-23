class ApplicationController < ActionController::Base
  before_action :require_login

  def require_login
    if logged_in?
      @user = User.find_by(:id => session[:user_id])
    else
      redirect_to root_path
    end
  end

  def logged_in?
    session[:user_id]
  end
end
