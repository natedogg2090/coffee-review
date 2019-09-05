class PurchasesController < ApplicationController

  def create
    purchase = Purchase.create(:user_id => params[:purchase][:user_id], :roast_id => params[:purchase][:roast_id])
    user = User.find_by(:id => params[:purchase][:user_id])
    flash[:notice] = purchase.buy_now
    redirect_to user_path(user)
  end
end
