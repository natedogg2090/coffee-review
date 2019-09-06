class PurchasesController < ApplicationController

  def create
    @purchase = Purchase.new(:user_id => params[:purchase][:user_id], :roast_id => params[:purchase][:roast_id], :payment_type => params[:purchase][:payment_type])
    user = User.find_by(:id => params[:purchase][:user_id])
    @roast = Roast.find_by(:id => params[:purchase][:roast_id])

    if @purchase.save
      flash[:notice] = @purchase.buy_now
      redirect_to user_path(user)
    else
      render 'roasts/show'
    end
  end
end
