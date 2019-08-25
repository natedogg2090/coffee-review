class ApplicationController < ActionController::Base
  before_action :require_login

  def require_login
    if !logged_in?
      redirect_to root_path
    end
  end

  def logged_in?
    session[:user_id]
  end

  def find_user(id)
    User.find_by(:id => id)
  end
end
