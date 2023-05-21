class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales, id: :uuid do |t|
      t.references :product_id, null: false, foreign_key: true, type: :uuid
      t.integer :amount
      t.references :creator_affiliated_id, null: false, foreign_key: true, type: :uuid
      t.references :transaction_type_id, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
