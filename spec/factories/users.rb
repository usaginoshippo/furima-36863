FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    last_name             { Gimei.first.kanji }
    first_name            { Gimei.last.kanji }
    last_name_kana        { Gimei.first.katakana }
    first_name_kana       { Gimei.last.katakana }
    birthday              { Faker::Date.between(from: '1930-01-01', to: Date.today) }
  end
end
