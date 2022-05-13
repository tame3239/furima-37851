FactoryBot.define do
  factory :order_address do
    post_code         { '123-4567' }
    prefectures_id    { 10 }
    city              { '横浜市緑区' }
    address           { '青山1-1-1' }
    telephone_number  { '09012345678' }
    building          { '柳ビル' }
    token             { 'tok_abcdefghijk00000000000000000' }
  end
end
