class OrdersController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      @order_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_delivery).permit( :postal_number, :prefecture_id, :municipality, :lot_number, :building, :telephone).merge(user_id: current_user.id, item_id: @item.id)
  end
end
