class RoastsController < ApplicationController

  def index
    @roasts = Roast.all
  end

  def new
    @roast = Roast.new
  end

  def create

    roast = Roast.new(roast_params)

    roaster = Roaster.find_or_create_by(:name => params[:roast][:roaster])
    roast.roaster_id = roaster.id

    roast.save

    redirect_to roasts_path
  end

  def show
    @roast = Roast.find_by(:id => params[:id])
  end

  private

  def roast_params
    params.require(:roast).permit(:name, :origin, :tasting_notes, :prep, :price, :roaster_id)
  end

end
