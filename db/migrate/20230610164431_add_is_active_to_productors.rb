# frozen_string_literal: true

class AddIsActiveToProductors < ActiveRecord::Migration[6.1]
  def change
    add_column :productors, :is_active, :boolean
  end
end
