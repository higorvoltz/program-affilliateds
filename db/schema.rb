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

ActiveRecord::Schema.define(version: 2023_05_21_172817) do

  create_table "affiliateds", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "balance"
    t.index ["id"], name: "index_affiliateds_on_id", unique: true
  end

  create_table "commissions", force: :cascade do |t|
    t.integer "sale_id_id", null: false
    t.integer "transaction_type_id_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["id"], name: "index_commissions_on_id", unique: true
    t.index ["sale_id_id"], name: "index_commissions_on_sale_id_id"
    t.index ["transaction_type_id_id"], name: "index_commissions_on_transaction_type_id_id"
  end

  create_table "productors", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "balance"
    t.index ["id"], name: "index_productors_on_id", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.text "name"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["id"], name: "index_products_on_id", unique: true
  end

# Could not dump table "sale_items" because of following StandardError
#   Unknown type 'uuid' for column 'id'

  create_table "sales", force: :cascade do |t|
    t.integer "product_id_id", null: false
    t.integer "amount"
    t.integer "creator_affiliated_id", null: false
    t.integer "transaction_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_affiliated_id"], name: "index_sales_on_creator_affiliated_id"
    t.index ["id"], name: "index_sales_on_id", unique: true
    t.index ["product_id_id"], name: "index_sales_on_product_id_id"
    t.index ["transaction_type_id"], name: "index_sales_on_transaction_type_id"
  end

  create_table "transaction_types", force: :cascade do |t|
    t.text "type"
    t.text "description"
    t.text "nature"
    t.text "signal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["id"], name: "index_transaction_types_on_id", unique: true
  end

  add_foreign_key "commissions", "sale_ids"
  add_foreign_key "commissions", "transaction_type_ids"
  add_foreign_key "sale_items", "product_ids"
  add_foreign_key "sale_items", "sale_ids"
  add_foreign_key "sales", "creator_affiliateds"
  add_foreign_key "sales", "product_ids"
  add_foreign_key "sales", "transaction_types"
end
