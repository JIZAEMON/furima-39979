FactoryBot.define do
  factory :order_shipping_address do

    postal_code       {"#{sprintf("%03d", rand(0..999))}-#{sprintf("%04d", rand(0..9999))}"}
    prefecture_id     {rand(1..47)}
    city              {Faker::Address.city}
    street_number     {Faker::Address.street_address}
    building_name     {Faker::Address.secondary_address}
    phone_number      {"#{sprintf("%011d", rand(0..99999999999))}"}
    
  end
end
