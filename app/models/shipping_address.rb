class ShippingAddress < ApplicationRecord

  # 空欄を許可しない
  validates :postal_code,                 presence: true
  validates :prefecture_id,               presence: true
  validates :city,                        presence: true
  validates :street_number,               presence: true
  validates :building_name,               presence: true
  validates :phone_number,                presence: true

  # アクティブハッシュを使うカラムは数字のみであり、初期選択肢の"---"では保存できない
  validates :prefecture_id,               numericality: { other_than: 0 , message: "can't be blank"}

  # 他モデルとのアソシエーションを記述
  belongs_to :order

  # アクティブハッシュとのアソシエーションを記述
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
