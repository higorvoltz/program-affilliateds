# frozen_string_literal: true

class CreateSaleItems < ActiveRecord::Migration[6.1]
  def change
    create_table :sale_items, id: :integer do |t|
      t.references :product, null: false, foreign_key: true, type: :integer
      t.integer :quantity

      t.timestamps
    end
    add_index :sale_items, :id, unique: true
  end
end
