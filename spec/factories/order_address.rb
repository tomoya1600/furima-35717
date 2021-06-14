FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city_name { '渋谷区' }
    block_name { '1-2-3' }
    building_name { '六本木ヒルズ' }
    phone_number { '08055552222' }
  end
end