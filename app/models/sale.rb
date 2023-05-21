# frozen_string_literal: true

class Sale < ApplicationRecord
  belongs_to :product
  belongs_to :creator_affiliated
  belongs_to :transaction_type
end
