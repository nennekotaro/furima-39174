FactoryBot.define do
  factory :item do
    name                { Faker::Lorem.word }
    info                { Faker::Lorem.sentence }
    price               { Faker::Number.within(range: 300..9_999_999) }
    category            { Category.all.sample }
    sales_status        { SalesStatus.all.sample }
    prefecture          { Prefecture.all.sample }
    scheduled_delivery  { ScheduledDelivery.all.sample }
    shipping_fee_status { ShippingFeeStatus.all.sample }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
