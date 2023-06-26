# frozen_string_literal: true

FactoryBot.define do
  factory :sale_item do
    quantity { rand(1..5) }
    product
  end
end
