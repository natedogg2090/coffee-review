class RoastsController < ApplicationController

  def index
    @user = find_user(session[:user_id])
    @roasts = Roast.all
  end

  def new
    if params[:roaster_id]
      @roast = Roast.new(:roaster_id => params[:roaster_id])
    else
      @roast = Roast.new
    end
    @user = find_user(session[:user_id])
  end

  def create
    @user = find_user(session[:user_id])

    @roast = Roast.new(roast_params)

    roaster = Roaster.find_or_create_by(:name => params[:roast][:roaster])
    @roast.roaster_id = roaster.id

    if !@roast.save
      render 'new'
    else
      redirect_to roasts_path
    end
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
    params.require(:roast).permit(:name, :origin, :tasting_notes, :preparation_method, :price, :roasted_date, :roaster_id)
  end

end
