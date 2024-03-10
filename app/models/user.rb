class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_format_of :password, with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'is invalid. Include both letters and numbers'
       
  validates :nickname, presence: true

  validates :first_name, presence: true
  validates_format_of :first_name, with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters'

  validates :first_name_kana, presence: true
  validates_format_of :first_name_kana, with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters'

  validates :last_name, presence: true
  validates_format_of :last_name, with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters'

  validates :last_name_kana, presence: true
  validates_format_of :last_name_kana, with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters'

  validates :birthday, presence: true
end
