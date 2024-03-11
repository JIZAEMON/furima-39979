FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              {"1a#{Faker::Internet.password(min_length: 4)}"}  #英数字を確実に含めるために先頭に'1a'
    password_confirmation {password}
    last_name             {'姓てすとテスト'}  #Fakerで日本語の出力方法が不明なので定値
    last_name_kana        {'セイテスト'}      #Fakerで日本語の出力方法が不明なので定値
    first_name            {'名てすとテスト'}  #Fakerで日本語の出力方法が不明なので定値
    first_name_kana       {'メイテスト'}      #Fakerで日本語の出力方法が不明なので定値
    birthday              {Faker::Date.between(from: '1930-01-1', to: 1.days.ago)}
  end
end