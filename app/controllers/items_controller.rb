class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :move_to_sign_in, except: [:index, :show]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to action: :index unless @item.user_id == current_user.id
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

  def move_to_sign_in
    redirect_to user_session_path unless user_signed_in?
  end
end
