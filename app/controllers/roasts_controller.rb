class RoastsController < ApplicationController

  def index
    @roasts = Roast.all
  end

  def new
    @roast = Roast.new
  end
end
