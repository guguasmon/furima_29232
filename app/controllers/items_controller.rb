class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_item, only: [:edit, :destroy, :show]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def destroy
    @item.destroy
    if @item.destroyed?
      redirect_to root_path
    else
      redirect_to item_path(@item.id)
    end
  end

  def show
    @category = Category.find(@item.category_id)
    @state = State.find(@item.state_id)
    @delivery = DeliveryType.find(@item.delivery_type_id)
    @prefecture = Prefecture.find(@item.prefecture_id)
    @duration = Duration.find(@item.duration_id)
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :state_id, :delivery_type_id, :prefecture_id, :duration_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
