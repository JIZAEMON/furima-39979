require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    user1 = FactoryBot.create(:user)  # 出品者想定
    user2 = FactoryBot.create(:user)  # 購入者想定
    item = FactoryBot.create(:item, user_id: user1.id)
    @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user2.id, item_id: item.id)
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できる' do
      expect(@order_shipping_address).to be_valid
    end
    it 'building_nameは空でも保存できる' do
      @order_shipping_address.building_name = ''
      expect(@order_shipping_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    # 記述順はモデル内バリデーションの記述順に準ずる

    # 空欄を許可しないバリデーション

      # postal_codeカラム
      it 'postal_codeが空だと保存できない' do
        @order_shipping_address.postal_code = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include "Postal code can't be blank"
      end

      # prefecture_idカラム
      it 'prefecture_idが空だと保存できない' do
        @order_shipping_address.prefecture_id = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include "Prefecture can't be blank"
      end

      # cityカラム
      it 'cityが空だと保存できない' do
        @order_shipping_address.city = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include "City can't be blank"
      end
      
      # street_numberカラム
      it 'street_numberが空だと保存できない' do
        @order_shipping_address.street_number = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include "Street number can't be blank"
      end

      # phone_numberカラム
      it 'phone_numberが空だと保存できない' do
        @order_shipping_address.phone_number = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include "Phone number can't be blank"
      end

      # user_id
      it 'user_idが空だと保存できない' do
        @order_shipping_address.user_id = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include "User can't be blank"
      end

      # item_id
      it 'item_idが空だと保存できない' do
        @order_shipping_address.item_id = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include "Item can't be blank"
      end
  
      # token
      it 'tokenが空だと保存できない' do
        @order_shipping_address.token = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include "Token can't be blank"
      end

    # 空欄を許可しないバリデーションの終了
    
    # postal_codeの入力制限
    it 'postal_codeが半角のハイフンを含んでいなければ保存できない' do
      @order_shipping_address.postal_code = '1234567'
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include "Postal code Only half-width strings in the format '3 digits - 4 digits' are allowed"
    end
    it 'postal_codeが3桁ハイフン3桁では保存できない' do
      @order_shipping_address.postal_code = '123-123'
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include "Postal code Only half-width strings in the format '3 digits - 4 digits' are allowed"
    end

    # phone_numberの入力制限
    it 'phone_numberが9桁では保存できない' do
      @order_shipping_address.phone_number = '123456789'
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include "Phone number Only half-width numbers between 10 and 11 digits are allowed"
    end
    it 'phone_numberが12桁では保存できない' do
      @order_shipping_address.phone_number = '123456789012'
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include "Phone number Only half-width numbers between 10 and 11 digits are allowed"
    end
    it 'phone_numberが全角数字では保存できない' do
      @order_shipping_address.phone_number = '１２３４５６７８９０１'
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include "Phone number Only half-width numbers between 10 and 11 digits are allowed"
    end
    it 'phone_numberがハイフンを含んでいる場合保存できない' do
      @order_shipping_address.phone_number = '000-0000-0000'
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include "Phone number Only half-width numbers between 10 and 11 digits are allowed"
    end

    # prefecture_idの入力制限
    it 'prefecture_idが0(初期選択肢)では保存できない' do
      @order_shipping_address.prefecture_id = 0
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include "Prefecture can't be blank"
    end


  end

end
