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

ActiveRecord::Schema.define(version: 20170919152900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "armies", force: :cascade do |t|
    t.bigint "civilization_id"
    t.integer "saldo", default: 1000
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["civilization_id"], name: "index_armies_on_civilization_id"
  end

  create_table "army_uniteds", force: :cascade do |t|
    t.bigint "army_id"
    t.bigint "united_id"
    t.integer "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["army_id"], name: "index_army_uniteds_on_army_id"
    t.index ["united_id"], name: "index_army_uniteds_on_united_id"
  end

  create_table "army_uniteds_trainings", force: :cascade do |t|
    t.bigint "army_united_id"
    t.bigint "training_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["army_united_id"], name: "index_army_uniteds_trainings_on_army_united_id"
    t.index ["training_id"], name: "index_army_uniteds_trainings_on_training_id"
  end

  create_table "civilizations", force: :cascade do |t|
    t.string "name"
    t.integer "piqueros"
    t.integer "arqueros"
    t.integer "caballero"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.bigint "army_id"
    t.string "estatus"
    t.integer "oponente"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["army_id"], name: "index_records_on_army_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.bigint "united_id"
    t.integer "puntos_obtenidos"
    t.integer "costo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["united_id"], name: "index_trainings_on_united_id"
  end

  create_table "transformations", force: :cascade do |t|
    t.bigint "united_id"
    t.string "unidad_convertir"
    t.integer "costo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["united_id"], name: "index_transformations_on_united_id"
  end

  create_table "uniteds", force: :cascade do |t|
    t.string "name"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "armies", "civilizations"
  add_foreign_key "army_uniteds", "armies"
  add_foreign_key "army_uniteds", "uniteds"
  add_foreign_key "army_uniteds_trainings", "army_uniteds"
  add_foreign_key "army_uniteds_trainings", "trainings"
  add_foreign_key "records", "armies"
  add_foreign_key "trainings", "uniteds"
  add_foreign_key "transformations", "uniteds"
end
