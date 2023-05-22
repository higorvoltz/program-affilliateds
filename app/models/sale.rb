# frozen_string_literal: true

class Sale < ApplicationRecord
  belongs_to :transaction_type
  belongs_to :productor_affiliated, optional: true
end
