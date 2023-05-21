# frozen_string_literal: true

class AddBalanceToAffiliateds < ActiveRecord::Migration[6.1]
  def change
    add_column :affiliateds, :balance, :integer
  end
end
