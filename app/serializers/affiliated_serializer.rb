# frozen_string_literal: true

class AffiliatedSerializer < ApplicationSerializer
  attributes :id, :name, :email, :balance, :productor_id
end
