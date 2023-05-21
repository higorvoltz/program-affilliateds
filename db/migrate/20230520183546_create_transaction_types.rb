class CreateTransactionTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :transaction_types, id: :uuid do |t|
      t.text :type
      t.text :description
      t.text :nature
      t.text :signal

      t.timestamps
    end
  end
end
