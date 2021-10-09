FactoryBot.define do
  factory :item do
    Faker::Config.locale = :ja
    title { Faker::Commerce.product_name }
    price { rand(300..9_999_999) }
    explanation { Faker::Lorem.paragraphs }
    category_id { rand(2..11) }
    status_id { rand(2..7) }
    postage_id { rand(2..3) }
    prefecture_id { rand(2..48) }
    period_id { rand(2..4) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
