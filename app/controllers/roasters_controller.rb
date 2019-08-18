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
    roaster.update(:name => params[:roaster][:name], :location => params[:roaster][:location])

    redirect_to roaster_path(roaster)
  end

  def create
    roaster = Roaster.new(:name => params[:roaster][:name], :location => params[:roaster][:location])
    roaster.save

    redirect_to roaster_path(roaster)
  end
end
