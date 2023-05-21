# frozen_string_literal: true

class AddProductorToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :productor_id, :integer
    add_foreign_key :products, :productors
  end
end
