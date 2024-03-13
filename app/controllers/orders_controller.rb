class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_shipping_address = OrderShippingAddress.new
  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_shipping_address_params)
    if @order_shipping_address.valid?
      redirect_to root_path#デバッグ用
      # @order_shipping_address.save
      # redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_shipping_address_params
    params.require(:order_shipping_address).permit(
      :item_id,
      :postal_code, 
      :prefecture_id, 
      :city, 
      :street_number, 
      :building_name,
      :phone_number
    ).merge(user_id: current_user.id)
  end
end
