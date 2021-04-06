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

ActiveRecord::Schema.define(version: 2021_03_30_231619) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "educational_institutions", force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
    t.string "institution_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.decimal "value_total"
    t.integer "installments"
    t.integer "due_date"
    t.string "course_name"
    t.bigint "educational_institution_id", null: false
    t.bigint "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["educational_institution_id"], name: "index_enrollments_on_educational_institution_id"
    t.index ["student_id"], name: "index_enrollments_on_student_id"
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "payment_value"
    t.date "due_date"
    t.bigint "enrollment_id", null: false
    t.string "status", default: "Aberta"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["enrollment_id"], name: "index_payments_on_enrollment_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.date "birthday"
    t.integer "cellphone"
    t.string "gender"
    t.string "payment_method"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "enrollments", "educational_institutions"
  add_foreign_key "enrollments", "students"
  add_foreign_key "payments", "enrollments"
end
