class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create ]
  before_action :correct_user, only: [:edit, :update]
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
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

  def correct_user
    if user_signed_in?
      if
      @item = current_user.items.find_by(id: params[:id])
        unless @item
          redirect_to root_path
        end
      end
    else
      redirect_to new_user_session_path
    end  
  end
end
