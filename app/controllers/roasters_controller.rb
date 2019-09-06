class RoastersController < ApplicationController
  skip_before_action :set_roaster, except: [:show, :edit, :update]

  def index
    @roasters = Roaster.all
  end

  def new
    @roaster = Roaster.new
  end

  def show
  end

  def edit
  end

  def update
    @roaster.update(roasters_params)

    redirect_to roaster_path(@roaster)
  end

  def create
    @roaster = Roaster.new(roasters_params)
    
    if !@roaster.save
      render 'new'
    else
      redirect_to roaster_path(@roaster)
    end
  end

  private

  def roasters_params
    params.require(:roaster).permit(:name, :location)
  end

end
