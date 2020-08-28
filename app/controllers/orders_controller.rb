class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @shopping = UserShopping.new
    @prefecture = Prefecture.find(@item.prefecture_id)
  end

  def create
    @shopping = UserShopping.new(shopping_params)
    # binding.pry
    if @shopping.valid?
      @shopping.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render("orders/index")
    end
  end

  private

  def shopping_params
    params.require(:user_shopping).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id).merge(item_id: params[:item_id], user_id: current_user.id)
    # , :token
  end
end
