# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products, id: :integer do |t|
      t.text :name
      t.integer :price

      t.timestamps
    end
    add_index :products, :id, unique: true
  end
end
