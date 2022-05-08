FactoryBot.define do
  factory :item do
    name              { Faker::Name.initials(number: 2) }
    explanation       { '商品の説明' }
    category_id       { 2 }
    item_condition_id { 3 }
    payer_id          { 2 }
    prefectures_id    { 35 }
    waiting_days_id   { 4 }
    price             { 10_000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
