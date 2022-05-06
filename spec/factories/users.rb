FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name            { '山田' }
    first_name           { '陸太郎' }
    last_name_katakana   { 'ヤマダ' }
    first_name_katakana  { 'リクタロウ' }
    birthday             { '1999-11-22' }
  end
end
