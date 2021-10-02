FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials }
    email { Faker::Internet.free_email }
    password { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    last_namej { Gimei.name.last.kanji }
    first_namej { Gimei.name.first.kanji }
    last_namek { Gimei.name.last.katakana }
    first_namek { Gimei.name.first.katakana }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2016-12-12') }
  end
end