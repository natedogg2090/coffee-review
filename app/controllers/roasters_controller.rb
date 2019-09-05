class RoastersController < ApplicationController
  before_action :set_user
  before_action :set_roaster, only: [:show, :edit]

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
    roaster = find_roaster(params[:id])
    roaster.update(roasters_params)

    redirect_to roaster_path(roaster)
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

  def set_user
    @user = find_user(session[:user_id])
  end

  def set_roaster
    @roaster = find_roaster(params[:id])
  end

end
