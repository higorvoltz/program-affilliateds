# frozen_string_literal: true

class SaleItem < ApplicationRecord
  belongs_to :sale
  belongs_to :product
end
