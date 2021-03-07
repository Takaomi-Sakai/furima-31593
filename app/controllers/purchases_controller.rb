class PurchasesController < ApplicationController
  def index
    @userorder = UserOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @userorder = UserOrder.new(userorder_params)
    @item = Item.find(params[:item_id])
    if @userorder.valid?
       @userorder.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def userorder_params
    params.require(:user_order).permit(:postalcode, :prefecture_id, :maincipality, :address, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end