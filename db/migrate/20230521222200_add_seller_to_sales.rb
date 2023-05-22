# frozen_string_literal: true

class AddSellerToSales < ActiveRecord::Migration[6.1]
  def change
    add_reference :sales, :seller, polymorphic: true, null: false
  end
end
