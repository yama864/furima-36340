FactoryBot.define do
  factory :item do
    image                 { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/flag.png')) }
    product_name          { Faker::String.random(length: 50) }
    description           { Faker::String.random(length: 500) }
    category_id           { Faker::Number.between(from: 1, to: 10) }
    status_id             { Faker::Number.between(from: 1, to: 6) }
    delivery_fee_id       { Faker::Number.between(from: 1, to: 2) }
    region_id             { Faker::Number.between(from: 1, to: 47) }
    ship_time_id          { Faker::Number.between(from: 1, to: 3) }
    price                 { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end
