class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    redirect_to_root_if_inappropriate
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user == @item.user
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :introduce, :category_id, :condition_id, :shipping_charge_payer_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  # ↓不適切な場合にトップページへ遷移
  def redirect_to_root_if_inappropriate
    # ↓商品が売却済みでorderを保有している場合、または閲覧ユーザーが出品ユーザーではない場合にトップページへ遷移
    redirect_to root_path if @item.order || current_user != @item.user
  end


end
