class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :move_to_sign_in, except: [:index, :show]
  before_action :set_item, only: [:show, :update, :edit, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  def edit
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def create
    @item = Item.new(item_params)
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
                                 :delivery_fee_id, :region_id,
                                 :ship_time_id, :price, :image)
          .merge(user_id: current_user.id)
  end

  def move_to_sign_in
    redirect_to user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless @item.user_id == current_user.id && !@item.order.present?
  end
end
