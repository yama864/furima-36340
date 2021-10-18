class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :description,
                                 :category_id, :status_id,
                                 :delivery_fee_id, :shipping_area_id,
                                 :ship_time_id, :price, :image)
          .merge(user_id: current_user.id)
  end
end
