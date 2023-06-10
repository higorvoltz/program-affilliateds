# frozen_string_literal: true

# client serializer
class ClientSerializer < ApplicationSerializer
  attributes :id, :name, :email, :balance
end
