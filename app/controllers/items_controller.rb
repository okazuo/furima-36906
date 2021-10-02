class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @item = Item.create(item_params)
  end

  
  private

  def item_params
    params.require(:item).permit(:title, :price, :explanation, :category_id, :status_id, :postage_id, :prefecture_id, :period_id).marge(user_id: current_user_id)
  end

end
