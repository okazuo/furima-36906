class ItemsController < ApplicationController
  def index
    @item = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  
  private

  def item_params
    params.require(:item).permit(:title, :price, :explanation, :category_id, :status_id, :postage_id, :prefecture_id, :period_id, :image,).merge(user_id: current_user.id)
  end

end
