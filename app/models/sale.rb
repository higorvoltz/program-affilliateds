# frozen_string_literal: true

class Sale < ApplicationRecord
  belongs_to :transaction_type
  belongs_to :productor_affiliated, optional: true
  belongs_to :seller, polymorphic: true

  validates :transaction_type_id, presence: true
  validates :sale_item_id, presence: true
  validates :seller_type, presence: true
  validates :seller_id, presence: true
end
