# frozen_string_literal: true

class CreateTransactionTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :transaction_types, id: :integer do |t|
      t.text :type
      t.text :description
      t.text :nature
      t.text :signal

      t.timestamps
    end
    add_index :transaction_types, :id, unique: true
  end
end
