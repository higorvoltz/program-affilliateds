# frozen_string_literal: true

FactoryBot.define do
  factory :product_ranking do
    ranking { rand(1..5) }
    client_id { rand(1..5) }
    product_id { rand(1..10) }
    client
    product
  end
end
