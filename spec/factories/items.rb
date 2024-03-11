FactoryBot.define do
  factory :item do
    name                      {Faker::Commerce.product_name}
    introduce                 {Faker::Lorem.sentence}
    category_id               {rand(2..11)}
    condition_id              {rand(2..7)}
    shipping_charge_payer_id  {rand(2..3)}
    prefecture_id             {rand(1..47)}
    days_to_ship_id           {rand(2..4)}
    price                     {rand(300..9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
