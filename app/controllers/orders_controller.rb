class OrdersController < ApplicationController
  before_action :set_params, only: [:index, :create]
  before_action :correct_user, only: [:index]
  
  def index
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      @item_order.save
      redirect_to root_path
    else
      render action: :index

    end
  end

    private
  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city, :house_number,:building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def set_params
    @item = Item.find(params[:item_id])
  end

  def correct_user
    redirect_to root_path if current_user.id == @item.user.id
  end
end
