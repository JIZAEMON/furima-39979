class Order < ApplicationRecord

  # 他モデルとのアソシエーションを記述
  belongs_to :user
  belongs_to :item
  has_one :shipping_address
  
end
