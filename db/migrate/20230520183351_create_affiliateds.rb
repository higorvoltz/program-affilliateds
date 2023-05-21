# frozen_string_literal: true

class CreateAffiliateds < ActiveRecord::Migration[6.1]
  def change
    create_table :affiliateds, id: :integer do |t|
      t.text :name
      t.text :email

      t.timestamps
    end
    add_index :affiliateds, :id, unique: true
  end
end
