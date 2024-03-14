require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do

    user1 = FactoryBot.create(:user)  # 出品者想定
    user2 = FactoryBot.create(:user)  # 購入者想定
    item = FactoryBot.create(:item, user_id: user1.id)
    @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user2.id, item_id: item.id)
    
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_shipping_address).to be_valid
    end

    it 'building_nameは空でも保存できること' do
      @order_shipping_address.building_name = ''
      expect(@order_shipping_address).to be_valid
    end

  end

  context '内容に問題がある場合' do
    # 順番はモデル内バリデーションの記述順に準ずる

    # 空欄を許可しない

      # postal_codeカラム
      it 'postal_codeが空だと保存できないこと' do
        @order_shipping_address.postal_code = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include "Postal code can't be blank"
      end

      # prefecture_idカラム
      it 'prefecture_idが空だと保存できないこと' do
        @order_shipping_address.prefecture_id = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include "Prefecture can't be blank"
      end

      # cityカラム
      it 'cityが空だと保存できないこと' do
        @order_shipping_address.city = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include "City can't be blank"
      end
      

      # # street_numberカラム
      # it 'street_numberが空だと保存できないこと' do
      #   @order_shipping_address.street_number = ''
      #   @order_shipping_address.valid?
      #   expect(@order_shipping_address.errors.full_messages).to include "Street number can't be blank"
      # end




    # it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    #   @order_shipping_address.postal_code = '1234567'
    #   @order_shipping_address.valid?
    #   expect(@order_shipping_address.errors.full_messages).to include "Postal code Only half-width strings in the format '3 digits - 4 digits' are allowed"
    # end


  end

end
