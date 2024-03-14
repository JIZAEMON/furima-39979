class OrdersController < ApplicationController

  # 非ログインユーザーをログインページへ遷移
  before_action :authenticate_user!

  # 商品が売却済みでorderを保有している場合、または商品の出品者と閲覧ユーザーが同じ場合にトップページへ遷移
  bedore_action :redirect_to_root_if_item_sold
  bedore_action :redirect_to_home_if_seller_viewing

  def index
    @item = Item.find(params[:item_id])
    @order_shipping_address = OrderShippingAddress.new
  end

  def create  
    @order_shipping_address = OrderShippingAddress.new(order_shipping_address_params)
    if @order_shipping_address.valid?
      @order_shipping_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end

  private

  # 商品が売却済みでorderを保有している場合にトップページへ遷移
  def redirect_to_root_if_item_sold
    redirect_to root_path if @item.order
  end

  # 商品の出品者と閲覧ユーザーが同じ場合にトップページへ遷移
  def redirect_to_home_if_seller_viewing
    redirect_to root_path if @item.user == current_user
  end

  # formオブジェクトOrderShippingAddress用にパラメータを許可・merge
  def order_shipping_address_params
    params.require(:order_shipping_address).permit(
      :postal_code, 
      :prefecture_id, 
      :city, 
      :street_number, 
      :building_name,
      :phone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
