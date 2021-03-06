class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :get_record, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @item = Item.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :explanation, :category_id, :status_id, :postage_id, :prefecture_id, :period_id,
                                 :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user.id == @item.user.id && @item.order.blank?
      redirect_to root_path 
    end
  end

  def get_record
    @item = Item.find(params[:id])
  end

end
