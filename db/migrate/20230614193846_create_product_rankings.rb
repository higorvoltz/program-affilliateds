# frozen_string_literal: true

class CreateProductRankings < ActiveRecord::Migration[6.1]
  def change
    create_table :product_rankings, id: :integer do |t|
      t.integer :ranking
      t.references :client, null: false, foreign_key: true, type: :integer
      t.references :product, null: false, foreign_key: true, type: :integer

      t.timestamps
    end
    add_index :product_rankings, :id, unique: true
  end
end
