# frozen_string_literal: true

class AddIsActiveToAffiliateds < ActiveRecord::Migration[6.1]
  def change
    add_column :affiliateds, :is_active, :boolean
  end
end
