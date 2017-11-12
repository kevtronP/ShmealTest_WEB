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

ActiveRecord::Schema.define(version: 20171112033205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "menuitems", force: :cascade do |t|
    t.string   "mealName"
    t.integer  "userID"
    t.string   "menuItemDate"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "merchantwebhooks", force: :cascade do |t|
    t.string   "kind"
    t.string   "merchantID"
    t.string   "message"
    t.string   "errorMessages"
    t.string   "bt_signature"
    t.string   "bt_payload"
    t.datetime "notificationTime"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "shmaddresses", force: :cascade do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "streetAddress"
    t.string   "streetAddress2"
    t.string   "locality"
    t.string   "postalCode"
    t.string   "region"
    t.datetime "addressDate"
    t.integer  "userID"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "shmcheckouts", force: :cascade do |t|
    t.string   "nonce"
    t.float    "amount"
    t.float    "feeAmount"
    t.string   "deviceData"
    t.string   "merchantID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shmconversations", force: :cascade do |t|
    t.string   "convChannel"
    t.integer  "originalCookID"
    t.integer  "originalEaterID"
    t.datetime "convStartDate"
    t.datetime "origCookCheckInDate"
    t.datetime "origEaterCheckInDate"
    t.datetime "lastMessageDate"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "shmcooks", force: :cascade do |t|
    t.string   "merchantID"
    t.string   "taxpayerID"
    t.string   "firstName"
    t.string   "surName"
    t.string   "birthDateString"
    t.string   "email"
    t.string   "phoneNumber"
    t.string   "streetAddress"
    t.string   "locality"
    t.string   "region"
    t.string   "postalCode"
    t.string   "fundingType"
    t.string   "accountNumber"
    t.string   "routingNumber"
    t.integer  "userID"
    t.datetime "cookDate"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "shmcookstatuses", force: :cascade do |t|
    t.string   "statusCode"
    t.integer  "cookID"
    t.datetime "statusStartDate"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "shmcustomerpmtmethods", force: :cascade do |t|
    t.string   "customerIDString"
    t.string   "firstName"
    t.string   "lastName"
    t.string   "paymentMethodToken"
    t.string   "paymentType"
    t.string   "cardLastFour"
    t.string   "venmoName"
    t.string   "nonce"
    t.integer  "userID"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "shmeals", force: :cascade do |t|
    t.datetime "shmealDayDate"
    t.integer  "menuItemID"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "shmfundings", force: :cascade do |t|
    t.integer  "userID"
    t.string   "merchantID"
    t.string   "fundingType"
    t.string   "email"
    t.string   "phoneNumber"
    t.string   "accountNumber"
    t.string   "routingNumber"
    t.datetime "fundingDate"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "shmmenuitemstatuses", force: :cascade do |t|
    t.string   "statusCode"
    t.integer  "menuItemID"
    t.datetime "statusStartDate"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "shmorderfeedbacks", force: :cascade do |t|
    t.integer  "requestID"
    t.float    "feedbackScore"
    t.string   "feedbackComment"
    t.datetime "feedbackTime"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "shmorders", force: :cascade do |t|
    t.datetime "orderDay"
    t.datetime "orderTime"
    t.integer  "conversationID"
    t.integer  "shmealID"
    t.integer  "eaterID"
    t.integer  "cookID"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "shmpaymentmethodstatuses", force: :cascade do |t|
    t.string   "statusCode"
    t.integer  "paymentMethodID"
    t.datetime "statusStartDate"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "shmpaymentnonces", force: :cascade do |t|
    t.string   "paymentMethodToken"
    t.string   "paymentNonce"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "shmrequestattributes", force: :cascade do |t|
    t.string   "attributeName"
    t.string   "requestAttribute"
    t.datetime "requestDateAtrb"
    t.datetime "attributeDate"
    t.integer  "requestID"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "shmrequeststatuses", force: :cascade do |t|
    t.string   "statusCode"
    t.integer  "requestID"
    t.datetime "statusStartDate"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "shmshmealattributes", force: :cascade do |t|
    t.string   "attributeName"
    t.string   "shmealAttribute"
    t.datetime "shmealAtrbDate"
    t.datetime "attributeDate"
    t.integer  "shmealID"
    t.integer  "menuItemID"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "shmshmealstatuses", force: :cascade do |t|
    t.string   "statusCode"
    t.integer  "shmealID"
    t.datetime "statusStartDate"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "shmeal_id"
  end

  create_table "shmtransactions", force: :cascade do |t|
    t.string   "client_token"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "shmuserattributes", force: :cascade do |t|
    t.string   "attributeName"
    t.string   "userAttribute"
    t.datetime "attributeDate"
    t.integer  "userID"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "shmuserstatuses", force: :cascade do |t|
    t.string   "statusCode"
    t.integer  "sendingUserID"
    t.integer  "receivingUserID"
    t.datetime "statusStartDate"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "userEmail"
    t.string   "userPhoneNumber"
    t.string   "userName"
    t.string   "lastName"
    t.datetime "userDate"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
