FactoryBot.define do
  factory :order_purchase_record do

    token                 { 'tok_abcdefghijk00000000000000000' }
    postcode              { '111-1111' }
    region_id             { Faker::Number.between(from: 1, to: 47) }
    city                  { Faker::String.random(length: 10) }
    street                { Faker::String.random(length: 20) }
    phone_number          { Faker::Number.number(digits: 11) }
  end
end
