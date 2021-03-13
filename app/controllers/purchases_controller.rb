class PurchasesController < ApplicationController
  def index
    @userorder = UserOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @userorder = UserOrder.new(userorder_params)
    @item = Item.find(params[:item_id])

    if @userorder.valid?
      pay_item
      @userorder.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def userorder_params
    params.require(:user_order).permit(:postalcode, :prefecture_id, :maincipality, :address, :building, :phone).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    # Payjp.api_key = "sk_test_7e3267488e7151fd7c2e7c3f"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: userorder_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
