class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :stock_item, only: [:index, :create]

  def index
    @order_purchase_record = OrderPurchaseRecord.new
    redirect_to root_path if @item.user_id == current_user.id || @item.order.present?
  end

  def create
    @order_purchase_record = OrderPurchaseRecord.new(order_params)
    if @order_purchase_record.valid?
      pay_item
      @order_purchase_record.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_purchase_record).permit(:postcode, :region_id, :city, :street, :building, :phone_number)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def stock_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
