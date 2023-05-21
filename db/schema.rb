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

ActiveRecord::Schema.define(version: 2023_05_20_183840) do

# Could not dump table "affiliateds" because of following StandardError
#   Unknown type 'uuid' for column 'id'

# Could not dump table "commissions" because of following StandardError
#   Unknown type 'uuid' for column 'id'

# Could not dump table "productors" because of following StandardError
#   Unknown type 'uuid' for column 'id'

# Could not dump table "products" because of following StandardError
#   Unknown type 'uuid' for column 'id'

# Could not dump table "sales" because of following StandardError
#   Unknown type 'uuid' for column 'id'

# Could not dump table "transaction_types" because of following StandardError
#   Unknown type 'uuid' for column 'id'

  add_foreign_key "commissions", "sale_ids"
  add_foreign_key "commissions", "transaction_type_ids"
  add_foreign_key "sales", "creator_affiliated_ids"
  add_foreign_key "sales", "product_ids"
  add_foreign_key "sales", "transaction_type_ids"
end
