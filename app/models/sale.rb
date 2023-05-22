# frozen_string_literal: true

class Sale < ApplicationRecord
  belongs_to :transaction_type
  belongs_to :productor_affiliated, optional: true
  belongs_to :seller, polymorphic: true
end
