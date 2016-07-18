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

ActiveRecord::Schema.define(version: 20160718064029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "menu_items", force: :cascade do |t|
    t.string   "mealAllergen1"
    t.string   "mealBlurb"
    t.datetime "mealLastDate"
    t.string   "mealName"
    t.integer  "mealQuantity"
    t.float    "mealScore"
    t.binary   "mealThumbnail"
    t.integer  "mealTotalQuantity"
    t.integer  "lastShmeal_id"
    t.integer  "photo_id"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "shmconversations", force: :cascade do |t|
    t.string   "convChannel"
    t.string   "convChannel2"
    t.datetime "convCheckIn1"
    t.datetime "convCheckIn2"
    t.datetime "convLastDate"
    t.string   "convLastMessage"
    t.string   "convUser1"
    t.string   "convUser2"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "shmeals", force: :cascade do |t|
    t.float    "shmealLat"
    t.float    "shmealLon"
    t.datetime "shmealPostDate"
    t.datetime "shmealDayDate"
    t.datetime "shmealStartTime"
    t.datetime "shmealEndTime"
    t.integer  "shmealQuantity"
    t.float    "shmealScore"
    t.integer  "menuItem_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "shmmenuitem_photos", force: :cascade do |t|
    t.binary   "data"
    t.integer  "menuItem"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shmnotifications", force: :cascade do |t|
    t.datetime "notificationDate"
    t.string   "notificationMessage"
    t.integer  "menuItem"
    t.integer  "otherUser"
    t.integer  "user"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "shmorders", force: :cascade do |t|
    t.datetime "orderActualTime"
    t.boolean  "orderApproved"
    t.datetime "orderDay"
    t.boolean  "orderPickedUp"
    t.float    "orderPrice"
    t.integer  "orderQuantity"
    t.float    "orderScore"
    t.datetime "orderTime"
    t.integer  "conversation"
    t.integer  "shmeal"
    t.integer  "eater"
    t.integer  "cook"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.float    "homeAddressLat"
    t.float    "homeAddressLon"
    t.string   "userBlurb"
    t.string   "userEmail"
    t.string   "userInstructions"
    t.string   "userName"
    t.string   "userPhoneNumber"
    t.float    "userScore"
    t.binary   "userThumbnail"
    t.integer  "userTotalShmeals"
    t.integer  "lastMenuItem_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
