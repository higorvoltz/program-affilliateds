# frozen_string_literal: true

# product ranking serializer
class ProductRankingSerializer < ApplicationSerializer
  attributes :id, :ranking, :client_id, :product_id
end
