FactoryBot.define do
  factory :buy_shipping do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code   { '012-3456' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { '千代田区永田町' }
    house_num     { '永田町1-7-1' }
    building      { '国会議事堂' }
    tel_num       { Faker::Number.number(digits: 10) }
  end
end
