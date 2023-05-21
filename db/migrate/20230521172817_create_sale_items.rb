# frozen_string_literal: true

class CreateSaleItems < ActiveRecord::Migration[6.1]
  def change
    create_table :sale_items, id: :uuid do |t|
      t.references :sale_id, null: false, foreign_key: true, type: :uuid
      t.references :product_id, null: false, foreign_key: true, type: :uuid
      t.integer :quantity

      t.timestamps
    end
    add_index :sale_items, :id, unique: true
  end
end
