FactoryBot.define do
  factory :item do
    title           { '商品名' }
    text            { '商品説明' }
    category_id     { 2 }
    status_id       { 2 }
    shipping_fee_id { 2 }
    prefecture_id   { 2 }
    scheduled_id    { 2 }
    price           { 1000 }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end