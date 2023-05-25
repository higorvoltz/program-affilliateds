# frozen_string_literal: true

class SaleItem < ApplicationRecord
  belongs_to :product

  validates :product_id, presence: true
  validates :quantity, presence: true
end
