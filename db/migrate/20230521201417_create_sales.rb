# frozen_string_literal: true

class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales, id: :integer do |t|
      t.references :product, null: false, foreign_key: true, type: :integer
      t.integer :amount
      t.references :productor_affiliated, null: true, foreign_key: true, type: :integer
      t.references :transaction_type, null: false, foreign_key: true, type: :integer

      t.timestamps
    end
    add_index :sales, :id, unique: true
  end
end
