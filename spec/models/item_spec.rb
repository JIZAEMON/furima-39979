require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '新規登録できるとき' do
      it '登録に必要なカラムに情報が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '新規登録できないとき' do
      # nameカラム
      it 'nameが空では登録できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      # introduceカラム
      it 'introduceが空では登録できない' do
        @item.introduce = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Introduce can't be blank"
      end
      # category_idカラム
      it 'category_idが空では登録できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      # condition_idカラム
      it 'condition_idが空では登録できない' do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'condition_idが初期値"---"では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      # shipping_charge_payer_idカラム
      it 'shipping_charge_payer_idが空では登録できない' do
        @item.shipping_charge_payer_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping charge payer can't be blank"
      end
      it 'shipping_charge_payer_idが初期値"---"では登録できない' do
        @item.shipping_charge_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping charge payer can't be blank"
      end
      # prefecture_idカラム
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'prefecture_idが初期値"---"では登録できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      # days_to_ship_idカラム 
      it 'days_to_ship_idが空では登録できない' do
        @item.days_to_ship_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to ship can't be blank"
      end
      it 'days_to_ship_idが初期値"---"では登録できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to ship can't be blank"
      end
      # priceカラム
      it 'priceが空では登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが300未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it 'priceが9999999超過では登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it 'priceが全角数字では登録できない' do
        @item.price = "５０００"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      # imageカラム
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      # userアソシエーション
      it 'userが紐づいていない場合登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end

end
