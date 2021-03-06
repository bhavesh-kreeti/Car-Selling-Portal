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

ActiveRecord::Schema.define(version: 2020_07_14_191306) do

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_brands_on_name"
  end

  create_table "car_costs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "condition", null: false
    t.string "price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["condition"], name: "index_car_costs_on_condition"
    t.index ["price"], name: "index_car_costs_on_price"
  end

  create_table "cities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_cities_on_name"
  end

  create_table "kilometer_drivens", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_kilometer_drivens_on_name"
  end

  create_table "locations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "address", null: false
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["address"], name: "index_locations_on_address"
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "models", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "brand_id"
    t.index ["brand_id"], name: "index_models_on_brand_id"
    t.index ["name"], name: "index_models_on_name"
  end

  create_table "registration_states", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_registration_states_on_name"
  end

  create_table "registration_years", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_registration_years_on_name"
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "roles", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["roles"], name: "index_roles_on_roles"
  end

  create_table "sellers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "city_id", null: false
    t.bigint "model_id", null: false
    t.bigint "registration_year_id", null: false
    t.bigint "kilometer_driven_id", null: false
    t.bigint "variant_id", null: false
    t.bigint "brand_id", null: false
    t.bigint "user_id"
    t.bigint "registration_state_id"
    t.string "purchase_status", default: "purchase"
    t.integer "buyer_id"
    t.index ["brand_id"], name: "index_sellers_on_brand_id"
    t.index ["city_id"], name: "index_sellers_on_city_id"
    t.index ["kilometer_driven_id"], name: "index_sellers_on_kilometer_driven_id"
    t.index ["model_id"], name: "index_sellers_on_model_id"
    t.index ["registration_state_id"], name: "index_sellers_on_registration_state_id"
    t.index ["registration_year_id"], name: "index_sellers_on_registration_year_id"
    t.index ["user_id"], name: "index_sellers_on_user_id"
    t.index ["variant_id"], name: "index_sellers_on_variant_id"
  end

  create_table "tokens", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "phoneno", null: false
    t.string "status", default: "processing"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "seller_id"
    t.datetime "appointment_date"
    t.bigint "car_cost_id"
    t.index ["car_cost_id"], name: "index_tokens_on_car_cost_id"
    t.index ["phoneno"], name: "index_tokens_on_phoneno"
    t.index ["seller_id"], name: "index_tokens_on_seller_id"
    t.index ["user_id"], name: "index_tokens_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest", null: false
    t.bigint "role_id"
    t.boolean "email_confirm", default: false
    t.string "confirm_token"
    t.index ["email"], name: "index_users_on_email"
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "variants", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_variants_on_name"
  end

  add_foreign_key "locations", "users"
  add_foreign_key "models", "brands"
  add_foreign_key "sellers", "brands"
  add_foreign_key "sellers", "cities"
  add_foreign_key "sellers", "kilometer_drivens"
  add_foreign_key "sellers", "models"
  add_foreign_key "sellers", "registration_states"
  add_foreign_key "sellers", "registration_years"
  add_foreign_key "sellers", "users"
  add_foreign_key "sellers", "variants"
  add_foreign_key "tokens", "car_costs"
  add_foreign_key "tokens", "sellers"
  add_foreign_key "tokens", "users"
  add_foreign_key "users", "roles"
end
