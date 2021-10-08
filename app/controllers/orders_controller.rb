class OrdersController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new(order_delivery_params)
    if @order_delivery.valid?
      pay_item
      @order_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  
  def order_delivery_params
    params.require(:order_delivery).permit( :postal_number, :prefecture_id, :municipality, :lot_number, :building, :telephone,).merge(user_id: current_user.id, item_id: @item.id, token: params[:token],price: @item.price)
  end
  
  def pay_item
    Payjp.api_key = 'sk_test_9ebe797059b35d6361c0e218'
    Payjp::Charge.create(
      amount: order_delivery_params[:price],
      card: order_delivery_params[:token],
      currency: 'jpy'
    )
  end

end
