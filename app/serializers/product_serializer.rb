# frozen_string_literal: true

class ProductSerializer < ApplicationSerializer
  attributes :id, :name, :price, :productor_id
end