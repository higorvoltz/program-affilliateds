# frozen_string_literal: true

class Commission < ApplicationRecord
  belongs_to :sale
  belongs_to :transaction_type
end
