class RoastersController < ApplicationController

  def index
    @roasters = Roaster.all
  end

  def new
    @roaster = Roaster.new
  end

  def show
    @roaster = Roaster.find_by(:id => params[:id])
  end

  def edit
    @roaster = Roaster.find_by(:id => params[:id])
  end

  def update
    roaster = Roaster.find_by(:id => params[:id])
    roaster.update(roasters_params)

    redirect_to roaster_path(roaster)
  end

  def create
    roaster = Roaster.new(roasters_params)
    roaster.save

    redirect_to roaster_path(roaster)
  end

  private

  def roasters_params
    params.require(:roaster).permit(:name, :location)
  end
end
