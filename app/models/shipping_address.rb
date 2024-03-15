class ShippingAddress < ApplicationRecord

  # 他モデルとのアソシエーションを記述
  belongs_to :order

  # アクティブハッシュとのアソシエーションを記述
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
