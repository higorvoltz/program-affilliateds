# frozen_string_literal: true

class Commission < ApplicationRecord
  belongs_to :sale_id
  belongs_to :transaction_type_id
end
