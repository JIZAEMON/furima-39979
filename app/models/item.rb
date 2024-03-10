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

  # 上限と下限を設定
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  # 半角数字のみを許可
  validates :price, format: { with: /\A[0-9]+\z/, message: "は半角数字のみで入力してください" }

  belongs_to :user
  has_one_attached :image

  def was_attached?
    self.image.attached?
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge_payer
  belongs_to :prefecture
  belongs_to :days_to_ship

end
