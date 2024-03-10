class Item < ApplicationRecord
  validates :name,                      presence: true
  validates :introduce,                 presence: true
  validates :category_id,               presence: true
  validates :condition_id,              presence: true
  validates :shipping_charge_payer_id,  presence: true
  validates :prefecture_id,             presence: true
  validates :days_to_ship_id,           presence: true
  validates :price,                     presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end
