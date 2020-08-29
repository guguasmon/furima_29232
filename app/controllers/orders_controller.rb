class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item_order, only: [:index, :create]

  def index
    @shopping = UserShopping.new
    @prefecture = Prefecture.find(@item.prefecture_id)
  end

  def create
      @shopping = UserShopping.new(shopping_params)
      if @shopping.valid?
        pay_item
        @shopping.save
        redirect_to root_path
      else
        render("orders/index")
      end
  end

  private

  def set_item_order
    @item = Item.find(params[:item_id])
  end

  def shopping_params
    params.require(:user_shopping).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id, :token).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    # @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: shopping_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end
