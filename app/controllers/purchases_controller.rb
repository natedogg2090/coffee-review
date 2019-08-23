class PurchasesController < ApplicationController

  def create
    purchase = Purchase.new(:user_id => params[:purchase][:user_id], :roast_id => params[:purchase][:roast_id])
    user = User.find_by_id(params[:purchase][:user_id])
  end
end
