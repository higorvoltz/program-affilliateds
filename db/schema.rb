# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_230_617_190_999) do
  create_table 'affiliateds', force: :cascade do |t|
    t.text 'name'
    t.text 'email'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'balance'
    t.integer 'productor_id'
    t.string 'password_digest'
    t.boolean 'is_active'
    t.index ['id'], name: 'index_affiliateds_on_id', unique: true
    t.index ['productor_id'], name: 'index_affiliateds_on_productor_id'
  end

  create_table 'clients', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.integer 'balance'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'password_digest'
    t.index ['id'], name: 'index_clients_on_id', unique: true
  end

  create_table 'product_rankings', force: :cascade do |t|
    t.integer 'ranking'
    t.integer 'client_id', null: false
    t.integer 'product_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['client_id'], name: 'index_product_rankings_on_client_id'
    t.index ['id'], name: 'index_product_rankings_on_id', unique: true
    t.index ['product_id'], name: 'index_product_rankings_on_product_id'
  end

  create_table 'productor_affiliateds', force: :cascade do |t|
    t.integer 'productor_id', null: false
    t.integer 'affiliated_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['affiliated_id'], name: 'index_productor_affiliateds_on_affiliated_id'
    t.index %w[productor_id affiliated_id], name: 'index_productor_affiliateds_on_productor_id_and_affiliated_id',
                                            unique: true
    t.index ['productor_id'], name: 'index_productor_affiliateds_on_productor_id'
  end

  create_table 'productors', force: :cascade do |t|
    t.text 'name'
    t.text 'email'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'balance'
    t.string 'password_digest'
    t.boolean 'is_active'
    t.index ['id'], name: 'index_productors_on_id', unique: true
  end

  create_table 'products', force: :cascade do |t|
    t.text 'name'
    t.integer 'price'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'productor_id'
    t.integer 'comission_value'
    t.integer 'last_sales', default: 0
    t.index ['id'], name: 'index_products_on_id', unique: true
  end

  create_table 'sale_items', force: :cascade do |t|
    t.integer 'product_id', null: false
    t.integer 'quantity'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['id'], name: 'index_sale_items_on_id', unique: true
    t.index ['product_id'], name: 'index_sale_items_on_product_id'
  end

  create_table 'sales', force: :cascade do |t|
    t.integer 'sale_item_id', null: false
    t.integer 'productor_affiliated_id'
    t.integer 'transaction_type_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'seller_type', null: false
    t.integer 'seller_id', null: false
    t.index ['id'], name: 'index_sales_on_id', unique: true
    t.index ['productor_affiliated_id'], name: 'index_sales_on_productor_affiliated_id'
    t.index ['sale_item_id'], name: 'index_sales_on_sale_item_id'
    t.index %w[seller_type seller_id], name: 'index_sales_on_seller'
    t.index ['transaction_type_id'], name: 'index_sales_on_transaction_type_id'
  end

  create_table 'transaction_types', force: :cascade do |t|
    t.text 'type'
    t.text 'description'
    t.text 'nature'
    t.text 'signal'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['id'], name: 'index_transaction_types_on_id', unique: true
  end

  add_foreign_key 'affiliateds', 'productors'
  add_foreign_key 'product_rankings', 'clients'
  add_foreign_key 'product_rankings', 'products'
  add_foreign_key 'productor_affiliateds', 'affiliateds'
  add_foreign_key 'productor_affiliateds', 'productors'
  add_foreign_key 'products', 'productors'
  add_foreign_key 'sale_items', 'products'
  add_foreign_key 'sales', 'productor_affiliateds'
  add_foreign_key 'sales', 'sale_items'
  add_foreign_key 'sales', 'transaction_types'
end
