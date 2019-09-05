class RoastsController < ApplicationController
  before_action :set_user
  before_action :set_roast, only: [:show, :edit, :update]
  skip_before_action :set_user, only: [:update]

  def index
    @roasts = Roast.all
  end

  def new
    if params[:roaster_id]
      @roast = Roast.new(:roaster_id => params[:roaster_id])
    else
      @roast = Roast.new
    end
  end

  def create

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
    if !@user.nil? && !@roast.nil?
      @purchase = Purchase.new(:user_id => @user.id, :roast_id => @roast.id)
    else
      render edit_roast_path(@roast)
    end

  end

  def edit
  end

  def update
    @roast.update(roast_params)

    redirect_to roast_path(@roast)
  end

  private

  def roast_params
    params.require(:roast).permit(:name, :origin, :tasting_notes, :preparation_method, :price, :roasted_date, :roaster_id)
  end

  def set_user
    @user = User.find_by(:id => session[:user_id])
  end

  def set_roast
    @roast = Roast.find_by(:id => params[:id])
  end

end
