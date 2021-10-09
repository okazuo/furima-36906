class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_record, only: [:index, :create]
  before_action :sold_item
  before_action :myself_order

  def index
    @order_delivery = OrderDelivery.new
  end

  def create
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
    params.require(:order_delivery).permit(:postal_number, :prefecture_id, :municipality, :lot_number, :building, :telephone).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token], price: @item.price
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: order_delivery_params[:price],
      card: order_delivery_params[:token],
      currency: 'jpy'
    )
  end

  def get_record
    @item = Item.find(params[:item_id])
  end

  def sold_item
    redirect_to root_path if @item.order.present?
  end

  def myself_order
    redirect_to root_path if current_user.id == @item.user.id
  end
end
