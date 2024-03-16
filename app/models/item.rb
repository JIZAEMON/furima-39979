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

  # アクティブハッシュを使うカラムは数字のみであり、初期選択肢の"---"では保存できない
  # 初期選択肢はpredecture_id(都道府県名)のみ0、それ以外は1
  validates :category_id,               numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,              numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_charge_payer_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,             numericality: { other_than: 0 , message: "can't be blank"}
  validates :days_to_ship_id,           numericality: { other_than: 1 , message: "can't be blank"}

  # priceに右記を設定 {半角数字のみ許可, 上限と下限を設定, 整数のみを許可}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }

  # 他モデルとのアソシエーションを記述
  belongs_to :user
  has_one :order

  # 画像用の記述
  has_one_attached :image

  # アクティブハッシュとのアソシエーションを記述
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge_payer
  belongs_to :prefecture
  belongs_to :days_to_ship
end
