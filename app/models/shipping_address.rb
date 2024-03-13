class ShippingAddress < ApplicationRecord

  # 空欄を許可しない
  validates :postal_code,       presence: true
  validates :prefecture_id,     presence: true
  validates :city,              presence: true
  validates :street_number,     presence: true
  validates :building_name,     presence: true
  validates :phone_number,      presence: true

  # 郵便番号の入力制限 : [3桁ハイフン4桁]の半角文字列のみ許可
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "Only half-width strings in the format '3 digits - 4 digits' are allowed" }

  # 電話番号の入力制限 : 10桁以上11桁以内の半角数値のみ許可
  validates :phone_number,format: { with: /\A\d{10,11}\z/, message: "Only half-width numbers between 10 and 11 digits are allowed" }

  # 都道府県の入力制限 : 初期選択肢の"---"(id=0)では保存できない
  validates :prefecture_id,               numericality: { other_than: 0 , message: "can't be blank"}

  # 他モデルとのアソシエーションを記述
  belongs_to :order

  # アクティブハッシュとのアソシエーションを記述
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
