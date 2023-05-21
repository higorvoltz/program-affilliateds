class CreateCommissions < ActiveRecord::Migration[6.1]
  def change
    create_table :commissions, id: :uuid do |t|
      t.references :sale_id, null: false, foreign_key: true, type: :uuid
      t.references :transaction_type_id, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
