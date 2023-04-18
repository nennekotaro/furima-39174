FactoryBot.define do
  factory :item do
    name                   { Faker::Lorem.word }
    info                   { Faker::Lorem.sentence }
    price                  { Faker::Number.within(range: 300..9_999_999) }
    category_id            { Faker::Number.between(from: 2, to: Category.all.length) }
    sales_status_id        { Faker::Number.between(from: 2, to: SalesStatus.all.length) }
    prefecture_id          { Faker::Number.between(from: 2, to: Prefecture.all.length) }
    scheduled_delivery_id  { Faker::Number.between(from: 2, to: ScheduledDelivery.all.length) }
    shipping_fee_status_id { Faker::Number.between(from: 2, to: ShippingFeeStatus.all.length) }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
