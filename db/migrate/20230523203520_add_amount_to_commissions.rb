# frozen_string_literal: true

class AddAmountToCommissions < ActiveRecord::Migration[6.1]
  def change
    add_column :commissions, :amount, :integer
  end
end
