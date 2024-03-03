class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_format_of :password, with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
       
  validates :nickname, presence: true

  validates :first_name, presence: true
  validates_format_of :first_name, with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'には漢字、ひらがな、カタカナ、英字、数字、ー（長音記号）のみを使用してください'

  validates :first_name_kana, presence: true
  validates_format_of :first_name_kana, with: /\A[ァ-ヶー]+\z/, message: 'にはカタカナ、ー（長音記号）のみを使用してください'

  validates :last_name, presence: true
  validates_format_of :last_name, with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'には漢字、ひらがな、カタカナ、英字、数字、ー（長音記号）のみを使用してください'

  validates :last_name_kana, presence: true
  validates_format_of :last_name_kana, with: /\A[ァ-ヶー]+\z/, message: 'にはカタカナ、ー（長音記号）のみを使用してください'

  validates :birthday, presence: true


end
