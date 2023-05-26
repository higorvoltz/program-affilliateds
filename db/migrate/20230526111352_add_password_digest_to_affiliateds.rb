class AddPasswordDigestToAffiliateds < ActiveRecord::Migration[6.1]
  def change
    add_column :affiliateds, :password_digest, :string
  end
end
