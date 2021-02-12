class OrdersController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @item_order = ItemOrder.new(order_params)
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
    params.permit(:postal_code, :prefecture_id, :city, :house_number,:building_name, :phone_number,:item_id).merge(user_id: current_user.id)
  end
end
