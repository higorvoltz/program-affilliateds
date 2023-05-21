# frozen_string_literal: true

class Sale < ApplicationRecord
  belongs_to :product_id
  belongs_to :creator_affiliated_id
  belongs_to :transaction_type_id
end
