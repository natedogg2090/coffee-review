class RoastsController < ApplicationController

  def index
    @roasts = Roast.all
  end

  def new
    @roast = Roast.new
  end

  def create

    roast = Roast.new(
      :name => params[:roast][:name], 
      :origin => params[:roast][:origin], 
      :tasting_notes => params[:roast][:tasting_notes], 
      :prep => params[:roast][:prep], 
      :price => params[:roast][:price])

    roaster = Roaster.find_or_create_by(:name => params[:roast][:roaster])
    roast.roaster_id = roaster.id

    roast.save

    redirect_to roasts_path
  end

end
