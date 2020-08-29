class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item_order, only: [:index, :create]
  before_action :move_to_index, only: :index

  def index
    @shopping = UserShopping.new
    @prefecture = Prefecture.find(@item.prefecture_id)
  end

  def create
    if @item.order.blank?
      @shopping = UserShopping.new(shopping_params)
      if @shopping.valid?
        pay_item
        @shopping.save
        redirect_to root_path
      else
        render('orders/index')
      end
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
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: shopping_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.order.present?
      redirect_to root_path
    end
  end
end
