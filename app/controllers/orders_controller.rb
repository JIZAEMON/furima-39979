class OrdersController < ApplicationController

  # 非ログインユーザーをログインページへ遷移
  before_action :authenticate_user!

  # 不適切な場合にトップページへ遷移
  before_action :redirect_to_root_if_inappropriate

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    item_set
    @order_shipping_address = OrderShippingAddress.new
  end

  def create  
    @order_shipping_address = OrderShippingAddress.new(order_shipping_address_params)
    item_set
    if @order_shipping_address.valid?
      pay_item
      @order_shipping_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  
  # URLのitem_idでitemを検索
  def item_set
    @item = Item.find(params[:item_id])
  end

  # 不適切な場合にトップページへ遷移
  def redirect_to_root_if_inappropriate
    item_set
    # 商品が売却済みでorderを保有している場合にトップページへ遷移
    redirect_to root_path if @item.order
    # 商品の出品者と閲覧ユーザーが同じ場合にトップページへ遷移
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
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  # クレジットカード決済用処理
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      
      # 商品の値段
      amount: @item.price,

      # カードトークン
      card: order_shipping_address_params[:token],
      
      # 通貨の種類(日本円)
      currency: 'jpy'
    )
  end

end
