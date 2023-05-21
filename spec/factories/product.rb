# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    price { Faker::Number.number(digits: 4) }
  end
end
