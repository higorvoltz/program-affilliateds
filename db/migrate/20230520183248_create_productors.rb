# frozen_string_literal:true

class CreateProductors < ActiveRecord::Migration[6.1]
  def change
    create_table :productors, id: :integer do |t|
      t.text :name
      t.text :email

      t.timestamps
    end
    add_index :productors, :id, unique: true
  end
end
