FactoryBot.define do
  factory :sale_item do
    sale_id { nil }
    product_id { nil }
    quantity { 1 }
  end
end
