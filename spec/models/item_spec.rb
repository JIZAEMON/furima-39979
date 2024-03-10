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
  end

end
