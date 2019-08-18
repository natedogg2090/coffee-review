class RoastersController < ApplicationController

  def index
    @roasters = Roaster.all
  end

  def show
    @roaster = Roaster.find_by(:id => params[:id])
  end
end
