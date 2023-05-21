# frozen_string_literal: true

class AddBalanceToProductors < ActiveRecord::Migration[6.1]
  def change
    add_column :productors, :balance, :integer
  end
end
