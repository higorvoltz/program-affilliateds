class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products, id: :uuid do |t|
      t.text :name
      t.integer :price

      t.timestamps
    end
  end
end
