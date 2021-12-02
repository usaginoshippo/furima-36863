FactoryBot.define do
  factory :item do

    item_name {Faker::Lorem.sentence}
    item_explanation {Faker::Lorem.paragraph(sentence_count: 2) }
    category_id {Faker::Number.between(from: 2, to: 11) }
    product_condition_id {Faker::Number.between(from: 2, to: 7) }
    ship_cost_id {Faker::Number.between(from: 2, to: 3) }
    prefecture_id {Faker::Number.between(from: 2, to: 48) }
    ship_day_id {Faker::Number.between(from: 2, to: 4) }
    price{Faker::Number.between(from: 300, to: 9999999) }
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end

  end
end
