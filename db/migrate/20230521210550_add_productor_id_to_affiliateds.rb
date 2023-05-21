# frozen_string_literal: true

class AddProductorIdToAffiliateds < ActiveRecord::Migration[6.1]
  def change
    add_reference :affiliateds, :productor, foreign_key: true
  end
end
