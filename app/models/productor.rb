# frozen_string_literal: true

class Productor < ApplicationRecord
  has_many :affiliateds
  has_many :products
end
