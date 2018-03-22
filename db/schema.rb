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

ActiveRecord::Schema.define(version: 20180322103601) do

  create_table "applications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "often_visiting_places", limit: 65535
    t.text     "good_at_genre",         limit: 65535
    t.integer  "user_id"
    t.integer  "profile_id"
    t.integer  "article_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["article_id"], name: "index_applications_on_article_id", using: :btree
    t.index ["profile_id"], name: "index_applications_on_profile_id", using: :btree
    t.index ["user_id"], name: "index_applications_on_user_id", using: :btree
  end

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "text",                   limit: 65535, null: false
    t.string   "image",                                null: false
    t.text     "comment",                limit: 65535, null: false
    t.integer  "price",                                null: false
    t.integer  "application_end_date_y",               null: false
    t.integer  "application_end_date_m",               null: false
    t.integer  "application_end_date_d",               null: false
    t.integer  "company_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["company_id"], name: "index_articles_on_company_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clips", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clips_on_user_id", using: :btree
  end

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                         null: false
    t.string   "avatar"
    t.string   "background_image"
    t.string   "catch_phrase"
    t.integer  "birth_date_y"
    t.integer  "birth_date_m"
    t.integer  "birth_date_d"
    t.integer  "sex"
    t.integer  "phone_number"
    t.integer  "postal_code"
    t.string   "region"
    t.string   "city"
    t.string   "adress"
    t.string   "building_name"
    t.string   "you_are_here"
    t.string   "private_link"
    t.text     "page_view",         limit: 65535
    t.string   "sns"
    t.text     "follower",          limit: 65535
    t.text     "occupations",       limit: 65535
    t.text     "language_skill",    limit: 65535
    t.text     "experience",        limit: 65535
    t.text     "travel_history",    limit: 65535
    t.text     "detailed_skill",    limit: 65535
    t.text     "achievement",       limit: 65535
    t.string   "income"
    t.text     "prepratatory_time", limit: 65535
    t.text     "travel_purpose",    limit: 65535
    t.text     "introduction",      limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "travel_plans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "departure_time",               null: false
    t.string   "return_time",                  null: false
    t.text     "destination",    limit: 65535, null: false
    t.integer  "profile_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["profile_id"], name: "index_travel_plans_on_profile_id", using: :btree
  end

  create_table "user_jobtags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "job_tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_tag_id"], name: "index_user_jobtags_on_job_tag_id", using: :btree
    t.index ["user_id"], name: "index_user_jobtags_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name",                                null: false
    t.integer  "magazine",                            null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "applications", "articles"
  add_foreign_key "applications", "profiles"
  add_foreign_key "applications", "users"
  add_foreign_key "articles", "companies"
  add_foreign_key "clips", "users"
  add_foreign_key "travel_plans", "profiles"
  add_foreign_key "user_jobtags", "job_tags"
  add_foreign_key "user_jobtags", "users"
end
