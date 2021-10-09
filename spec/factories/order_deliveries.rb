FactoryBot.define do
  factory :order_delivery do
    postal_number { format('%03d', rand(0..999)) + '-' + format('%04d', rand(0..9999)) }
    prefecture_id { rand(2..48) }
    municipality { Faker::Address.city }
    lot_number { Faker::Address.street_address }
    building { Faker::Address.secondary_address }
    telephone { Faker::Number.leading_zero_number(digits: 11) }
    token { Faker::Internet.uuid }
  end
end
