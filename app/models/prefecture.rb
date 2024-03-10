class Prefecture < ActiveHash::Base
  #imemsテーブル用のハッシュ:発送元地域(県)

  self.data = [

  ]

  include ActiveHash::Associations
  has_many :items

  end