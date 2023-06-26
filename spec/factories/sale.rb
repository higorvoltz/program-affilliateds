# frozen_string_literal: true

FactoryBot.define do
  factory :sale do
    sale_item_id { rand(1..5) }
    transaction_type_id { 1 }
    seller_type { 'Productor' }
    seller_id { rand(1..5) }
  end
end
