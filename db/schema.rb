# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_23_190737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "attachments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "file"
    t.integer "debt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "creditors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "financial_agent", default: false
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.string "formula"
    t.string "code"
    t.text "description"
    t.string "last_currency"
    t.date "date_currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "debts", force: :cascade do |t|
    t.integer "code"
    t.decimal "contract_value"
    t.date "signature_date"
    t.integer "creditor_id"
    t.date "grace_period"
    t.date "amortization_period"
    t.text "purpose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amortization_type"
    t.integer "financial_agent_id"
    t.string "applicable_legislation"
    t.integer "legislation_level"
    t.string "name"
    t.text "notes"
    t.integer "category"
    t.integer "currency_id"
    t.integer "loan_term"
    t.decimal "interest_rate"
    t.integer "decimal_places"
    t.boolean "start_amt_next_month_to_grace_period"
  end

  create_table "manuals", force: :cascade do |t|
    t.string "last_currency"
    t.date "date_currency"
    t.bigint "currency_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["currency_id"], name: "index_manuals_on_currency_id"
  end

  create_table "transaction_infos", force: :cascade do |t|
    t.string "formula"
    t.integer "payment_day"
    t.text "description"
    t.integer "debt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "frequency"
    t.integer "category_number"
    t.string "slug"
    t.decimal "base"
    t.boolean "bind_withdraw"
  end

  create_table "transaction_items", force: :cascade do |t|
    t.decimal "value"
    t.decimal "value_brl"
    t.date "date"
    t.decimal "exchange_rate"
    t.decimal "start_balance"
    t.decimal "start_outstanding_balance_brl"
    t.integer "transaction_info_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "internalization_date"
    t.boolean "confirmed"
    t.string "formula"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "manuals", "currencies"
end
