class OrdersController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.create(params.permit(:item_id).merge(user_id: current_user.id))
    Delivery.create(params.permit(:postal_number, :prefecture_id, :municipality, :lot_number, :building, :telephone).merge(order_id: @order.id))
  end
end
