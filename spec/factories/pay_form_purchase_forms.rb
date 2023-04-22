FactoryBot.define do
  factory :pay_form_purchase_form do
    postal_code            { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    prefecture_id          { Faker::Number.between(from: 2, to: Prefecture.all.length) }
    city                   { Faker::Address.city }
    addresses              { Faker::Address.street_address }
    building               { Faker::Lorem.word }
    phone_number           { Faker::PhoneNumber.subscriber_number(length: 11) }
    token                  {"tok_#{SecureRandom.hex(10)}"}
  end
end
