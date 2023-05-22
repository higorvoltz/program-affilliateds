# frozen_string_literal: true

class Commission < ApplicationRecord
  belongs_to :sale
  belongs_to :transaction_type

  before_save :set_paid_based_on_transaction_type

  private

  def set_paid_based_on_transaction_type
    self.must_pay = transaction_type_id == 2
  end
end
