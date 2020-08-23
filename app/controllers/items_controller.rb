class ItemsController < ApplicationController
  def index
    @items = Item.all
    # includes(:order).order("created_at DESC")
  end

  private
  def item_params
    # params.require(:item).permit(,:image)
  end
end
