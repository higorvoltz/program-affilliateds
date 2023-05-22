# frozen_string_literal: true

class CreateCommissions < ActiveRecord::Migration[6.1]
  def change
    create_table :commissions, id: :integer do |t|
      t.references :sale, null: false, foreign_key: true, type: :integer
      t.references :transaction_type, null: false, foreign_key: true, type: :integer
      t.boolean :must_pay

      t.timestamps
    end
    add_index :commissions, :id, unique: true
  end
end
