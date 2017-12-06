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

ActiveRecord::Schema.define(version: 20171206174414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id"
    t.boolean "active", default: true
    t.index ["company_id"], name: "index_clients_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.boolean "is_admin", default: false
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "schedule_color", default: "#00AA00"
    t.string "password_digest"
    t.boolean "active", default: true
    t.index ["company_id"], name: "index_employees_on_company_id"
  end

  create_table "operations", force: :cascade do |t|
    t.bigint "employee_id"
    t.bigint "planners_procedure_id"
    t.float "hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: ""
    t.index ["employee_id"], name: "index_operations_on_employee_id"
    t.index ["planners_procedure_id", "employee_id"], name: "index_operations_on_planners_procedure_id_and_employee_id", unique: true
    t.index ["planners_procedure_id"], name: "index_operations_on_planners_procedure_id"
  end

  create_table "pieces", force: :cascade do |t|
    t.bigint "project_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "complete", default: false
    t.index ["project_id"], name: "index_pieces_on_project_id"
  end

  create_table "planners", force: :cascade do |t|
    t.date "monday"
    t.date "friday"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "allotted_time", default: 150.0
    t.index ["company_id"], name: "index_planners_on_company_id"
  end

  create_table "planners_procedures", force: :cascade do |t|
    t.bigint "planner_id"
    t.bigint "procedure_id"
    t.float "allotted_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "piece_id"
    t.integer "project_id"
    t.index ["planner_id"], name: "index_planners_procedures_on_planner_id"
    t.index ["procedure_id"], name: "index_planners_procedures_on_procedure_id"
  end

  create_table "procedures", force: :cascade do |t|
    t.bigint "service_id"
    t.bigint "piece_id"
    t.float "estimated_time"
    t.boolean "complete", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
    t.index ["piece_id"], name: "index_procedures_on_piece_id"
    t.index ["service_id"], name: "index_procedures_on_service_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "subtype", default: "basic"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "complete", default: false
    t.boolean "active", default: true
    t.index ["client_id"], name: "index_projects_on_client_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "employee_id"
    t.datetime "scheduled_start"
    t.datetime "scheduled_end"
    t.boolean "is_holiday", default: false
    t.float "break_took", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["employee_id"], name: "index_schedules_on_employee_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "default_time", default: 2.0
    t.index ["company_id"], name: "index_services_on_company_id"
  end

  add_foreign_key "clients", "companies"
  add_foreign_key "employees", "companies"
  add_foreign_key "operations", "employees"
  add_foreign_key "operations", "planners_procedures"
  add_foreign_key "pieces", "projects"
  add_foreign_key "planners", "companies"
  add_foreign_key "planners_procedures", "planners"
  add_foreign_key "planners_procedures", "procedures"
  add_foreign_key "procedures", "pieces"
  add_foreign_key "procedures", "services"
  add_foreign_key "projects", "clients"
  add_foreign_key "schedules", "employees"
  add_foreign_key "services", "companies"
end
