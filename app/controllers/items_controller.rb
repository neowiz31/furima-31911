class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_params, only: [:show, :edit, :destroy, :update]
  before_action :correct_item, only: [:edit, :update, :destory]
  before_action :correct_user, only: [:edit, :update, :destory]


  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def destroy
    redirect_to root_path if @item.destroy
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :delivery_cost_id, :delivery_time_id,
                                 :item_category_id, :item_quality_id, :prefecture_id, :price).merge(user_id: current_user.id)
  end

  def set_params
    @item = Item.find(params[:id])
  end

  def correct_user
    redirect_to root_path if current_user.id != @item.user.id
  end

  def correct_item
    unless Order.exists?(item_id:@item.id)
    else
      redirect_to root_path
    end
  end
end
