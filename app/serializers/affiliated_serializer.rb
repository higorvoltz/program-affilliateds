# frozen_string_literal: true

class AffiliatedSerializer < ApplicationSerializer
  attributes :id, :name, :email, :is_active, :balance, :productor_id
end
