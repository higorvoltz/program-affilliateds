class AddCommissionValueToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :comission_value, :integer
  end
end
