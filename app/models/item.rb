class Item < ApplicationRecord

  # 空欄を許可しない
  validates :name,                      presence: true
  validates :introduce,                 presence: true
  validates :category_id,               presence: true
  validates :condition_id,              presence: true
  validates :shipping_charge_payer_id,  presence: true
  validates :prefecture_id,             presence: true
  validates :days_to_ship_id,           presence: true
  validates :price,                     presence: true
  validates :image,                     presence: true

  # アクティブハッシュを使うカラムは数字のみであり、1(初期選択肢の"---")では保存できない
  validates :category_id,               numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,              numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_charge_payer_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,             numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_to_ship_id,           numericality: { other_than: 1 , message: "can't be blank"}

  # priceに上限と下限を設定
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  # priceに半角数字のみを許可
  validates :price, format: { with: /\A[0-9]+\z/, message: "should be entered in half-width numbers only" }

  # アソシエーションを記述
  belongs_to :user
  has_one_attached :image

  # アクティブハッシュの記述
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge_payer
  belongs_to :prefecture
  belongs_to :days_to_ship

end
