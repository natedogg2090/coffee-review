class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :set_user, :set_roast, :set_roaster

  def require_login
    if !logged_in?
      redirect_to root_path
    end
  end

  def logged_in?
    session[:user_id]
  end

  def set_user
    @user = User.find_by(:id => session[:user_id])
  end

  def set_roast
    @roast = Roast.find_by(:id => params[:id])
  end

  def set_roaster
    @roaster = Roaster.find_by(:id => params[:id])
  end

end
