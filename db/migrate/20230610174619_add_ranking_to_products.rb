# frozen_string_literal: true

class AddRankingToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :ranking, :integer, null: true
  end
end
