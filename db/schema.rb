# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171122003704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.boolean "is_admin"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "schedule_color", default: "red"
    t.index ["company_id"], name: "index_employees_on_company_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "img_url"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_products_on_company_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "employee_id"
    t.datetime "scheduled_start"
    t.datetime "scheduled_end"
    t.datetime "actual_start"
    t.datetime "actual_end"
    t.boolean "is_holiday", default: false
    t.float "break_took", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_schedules_on_employee_id"
  end

  add_foreign_key "employees", "companies"
  add_foreign_key "schedules", "employees"
end
