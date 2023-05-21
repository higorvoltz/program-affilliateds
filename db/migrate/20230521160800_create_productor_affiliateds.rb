# frozen_string_literal: true

class CreateProductorAffiliateds < ActiveRecord::Migration[6.1]
  def change
    create_table :productor_affiliateds, id: false do |t|
      t.references :productor, null: false, foreign_key: true
      t.references :affiliated, null: false, foreign_key: true

      t.timestamps
    end
    add_index :productor_affiliateds, %i[productor_id affiliated_id], unique: true
  end
end
