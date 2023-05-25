# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    price { Faker::Number.number(digits: 4) }
    comission_value { Faker::Number.number(digits: 3) }
    productor
  end
end
