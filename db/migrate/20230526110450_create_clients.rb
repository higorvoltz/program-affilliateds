class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients, id: :integer do |t|
      t.string :name
      t.string :email
      t.integer :balance

      t.timestamps
    end
    add_index :clients, :id, unique: true
  end
end
