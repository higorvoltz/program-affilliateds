class AddPasswordDigestToProductors < ActiveRecord::Migration[6.1]
  def change
    add_column :productors, :password_digest, :string
  end
end
