class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.create(order_params)
    ShippingAddress.create(shipping_address_params)
    redirect_to root_path
  end

  private

  def order_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def shipping_address_params
    params.permit(
      :postal_code, 
      :prefecture, 
      :city, 
      :street_number, 
      :building_name,
      :phone_number
    ).merge(order_id: @order.id)
  end
end
