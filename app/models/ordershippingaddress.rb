class OrderShippingAddress
  include ActiveModel::Model
  # ShippingAddressモデルのカラムを指定
  attr_accessor :postal_code, 
                :prefecture, 
                :city, 
                :street_number, 
                :building_name, 
                :phone_number, 

  # ShippingAddressモデルカラムのバリデーションを指定

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
  
  # Orderモデルのアソシエーション用のバリデーション
  validates :user_id,     presence: true
  validates :item_id,     presence: true

  # ShippingAddressモデルのアソシエーション用のバリデーション
  validates :order_id,    presence: true

  # レコード保存処理
  def save
    # Orderレコード生成、変数に代入
    order = Order.create(user_id: user_id, item_id: item_id)

    # ShippingAddressレコード生成
    ShippingAddress.create(
      postal_code: postal_code, 
      prefecture: prefecture, 
      city: city, 
      street_number: street_number, 
      building_name: building_name, 
      phone_number: phone_number,
      order_id: order.id
    )
  end

end