# frozen_string_literal: true

class ProductRanking < ApplicationRecord
  belongs_to :client
  belongs_to :product

  validates :ranking, inclusion: { in: 1..5 }, allow_nil: true
end
