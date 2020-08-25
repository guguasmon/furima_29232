class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
    @items = Item.all
    # includes(:order).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    # params.require(:item).permit(,:image)
  end
end
