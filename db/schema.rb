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

ActiveRecord::Schema.define(version: 2020_02_08_100838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "basket_items", force: :cascade do |t|
    t.bigint "basket_id", null: false
    t.bigint "item_id", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["basket_id"], name: "index_basket_items_on_basket_id"
    t.index ["item_id"], name: "index_basket_items_on_item_id"
  end

  create_table "baskets", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "item_promotions", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "promotion_id", null: false
    t.index ["item_id"], name: "index_item_promotions_on_item_id"
    t.index ["promotion_id"], name: "index_item_promotions_on_promotion_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "price", null: false
    t.index ["name"], name: "index_items_on_name"
  end

  create_table "promotions", force: :cascade do |t|
    t.string "type", null: false
    t.hstore "rule", default: {}
    t.boolean "active", default: true
    t.datetime "from"
    t.datetime "to"
    t.index ["type"], name: "index_promotions_on_type"
  end

  add_foreign_key "basket_items", "baskets"
  add_foreign_key "basket_items", "items"
  add_foreign_key "item_promotions", "items"
  add_foreign_key "item_promotions", "promotions"
end
