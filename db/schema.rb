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

ActiveRecord::Schema[7.0].define(version: 2023_09_11_151932) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome"
  end

  create_table "formulation_recipe", force: :cascade do |t|
    t.string "product_code"
    t.string "product_description"
    t.boolean "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "formulations", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "project_name"
    t.string "itens"
  end

  create_table "raw_materials", force: :cascade do |t|
    t.string "product_name"
    t.string "product_type"
    t.float "volume_solid"
    t.float "weight_solid"
    t.float "volatile_organic_compound"
    t.float "pigment_volume_concentration"
    t.float "density"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "table_employees", force: :cascade do |t|
    t.string "nom"
    t.string "titre_poste"
    t.text "responsabilite"
    t.text "exigence"
    t.text "experience"
    t.text "profil_competence"
    t.text "besoin_marche"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
