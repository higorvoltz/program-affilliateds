# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :productor

  validates :name, presence: true
  validates :price, presence: true
  validates :productor_id, presence: true
  validates :comission_value, presence: true
end
