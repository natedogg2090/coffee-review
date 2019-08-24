class RoastsController < ApplicationController

  def index
    @roasts = Roast.all
    @user = find_user(session[:user_id])
  end

  def new
    @roast = Roast.new
  end

  def create
    user = find_user(session[:user_id])

    roast = Roast.new(roast_params)

    roaster = Roaster.find_or_create_by(:name => params[:roast][:roaster])
    roast.roaster_id = roaster.id

    roast.save

    redirect_to roasts_path
  end

  def show
    @roast = Roast.find_by(:id => params[:id])
    @user = find_user(session[:user_id])
    if !@user.nil? && !@roast.nil?
      @purchase = Purchase.new(:user_id => @user.id, :roast_id => @roast.id)
    else
      render edit_roast_path(@roast)
    end

  end

  def edit
    @roast = Roast.find_by(:id => params[:id])
  end

  def update
    roast = Roast.find_by(:id => params[:id])
    roast.update(roast_params)

    redirect_to roast_path(roast)
  end

  private

  def roast_params
    params.require(:roast).permit(:name, :origin, :tasting_notes, :preparation_method, :price, :inventory, :roasted_date, :roaster_id)
  end

  def find_user(id)
    User.find_by(:id => id)
  end

end
