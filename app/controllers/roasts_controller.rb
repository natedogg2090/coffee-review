class RoastsController < ApplicationController

  def index
    if logged_in?
      @roasts = Roast.all
    else
      redirect_to root_path
    end
  end

  def new
    @roast = Roast.new
  end

  def create
    user = User.find_by(:id => session[:user_id])

    roast = Roast.new(roast_params)

    roaster = Roaster.find_or_create_by(:name => params[:roast][:roaster])
    roast.roaster_id = roaster.id

    roast.save

    redirect_to roasts_path
  end

  def show
    @roast = Roast.find_by(:id => params[:id])
    @user = User.find_by(:id => session[:user_id])
    @purchase = Purchase.new(:user_id => @user.id, :roast_id => @roast.id)
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

end
