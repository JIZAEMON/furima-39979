FactoryBot.define do
  factory :order_shipping_address do
    postal_code       {"123-1234"}
    prefecture_id     {5}
    city              {"Dcity"}
    street_number     {"Dstreet_number"}
    building_name     {"Dbuilding_name"}
    phone_number      {"00011112222"}
    order_id          {5}
    item_id           {5}
    user_id           {5}
  end
end
