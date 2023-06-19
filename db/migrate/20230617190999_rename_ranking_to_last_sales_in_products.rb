# frozen_string_literal: true

class RenameRankingToLastSalesInProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :last_sales, :integer, default: 0
    remove_column :products, :ranking
  end
end
