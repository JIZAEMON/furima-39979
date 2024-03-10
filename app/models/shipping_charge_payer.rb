class Shipping_charge_payer < ActiveHash::Base
  #imemsテーブル用のハッシュ:送料負担者

  self.data = [
    { id: 1,  name: '---' },
    { id: 2,  name: '着払い(購入者負担)' },
    { id: 3,  name: '送料込み(出品者負担)' }
  ]

  include ActiveHash::Associations
  has_many :items

  end