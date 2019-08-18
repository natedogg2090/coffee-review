class RoastersController < ApplicationController

  def index
    @roasters = Roaster.all
  end

  def show
    @roaster = Roaster.find_by(:id => params[:id])
  end

  def edit
    @roaster = Roaster.find_by(:id => params[:id])
  end

  def update
    roaster = Roaster.find_by(:id => params[:id])
    roaster.update(:name => params[:roaster][:name], :location => params[:roaster][:location])

    redirect_to roaster_path(roaster)
  end
end
