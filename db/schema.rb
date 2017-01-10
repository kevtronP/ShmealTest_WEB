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

ActiveRecord::Schema.define(version: 20170110002506) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "devices", force: :cascade do |t|
    t.string   "deviceToken"
    t.boolean  "pushNotificationsOn"
    t.datetime "deviceTokenBeginDate"
    t.integer  "userID"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

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

  create_table "menuitems", force: :cascade do |t|
    t.string   "mealName"
    t.string   "mealBlurb"
    t.datetime "mealLastDate"
    t.integer  "mealQuantity"
    t.float    "mealScore"
    t.integer  "mealScoreQuantity"
    t.integer  "mealTotalQuantity"
    t.string   "mealAllergen1"
    t.string   "mealAllergen2"
    t.string   "mealAllergen3"
    t.string   "mealAllergen4"
    t.string   "mealAllergen5"
    t.string   "mealAllergen6"
    t.integer  "userID"
    t.string   "mealPhotoURL"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
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

  create_table "shmchatchannels", force: :cascade do |t|
    t.string   "chatChannel"
    t.datetime "chatCheckIn1"
    t.datetime "chatCheckIn2"
    t.string   "chatUser1"
    t.string   "chatUser2"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "shmcheckins", force: :cascade do |t|
    t.datetime "checkInTime"
    t.boolean  "messageSent"
    t.integer  "userID"
    t.integer  "conversationID"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "shmcheckouts", force: :cascade do |t|
    t.string   "nonce"
    t.float    "amount"
    t.string   "merchantID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shmconversations", force: :cascade do |t|
    t.string   "convChannel"
    t.datetime "convCheckIn1"
    t.datetime "convCheckIn2"
    t.datetime "convLastDate"
    t.string   "convLastMessage"
    t.string   "convUser1"
    t.string   "convUser2"
    t.integer  "originalCookID"
    t.integer  "originalEaterID"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
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
    t.float    "shmealLat"
    t.float    "shmealLon"
    t.datetime "shmealPostDate"
    t.datetime "shmealDayDate"
    t.datetime "shmealStartTime"
    t.datetime "shmealEndTime"
    t.integer  "shmealQuantity"
    t.float    "shmealScore"
    t.integer  "menuItemID"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "shmmenuitem_photos", force: :cascade do |t|
    t.binary   "data"
    t.integer  "menuItem"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shmmenuitemstatuses", force: :cascade do |t|
    t.string   "statusCode"
    t.integer  "menuItemID"
    t.datetime "statusStartDate"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "shmnotifications", force: :cascade do |t|
    t.integer  "userID"
    t.integer  "otherUserID"
    t.integer  "menuItemID"
    t.string   "notificationMessage"
    t.datetime "notificationDate"
    t.datetime "unfollowTimeStamp"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
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
    t.datetime "orderActualTime"
    t.boolean  "orderApproved"
    t.datetime "orderDay"
    t.datetime "orderPickupTime"
    t.boolean  "orderPickedUp"
    t.float    "orderPrice"
    t.integer  "orderQuantity"
    t.float    "orderScore"
    t.boolean  "orderReviewIgnored"
    t.datetime "orderTime"
    t.integer  "conversationID"
    t.integer  "shmealID"
    t.integer  "eaterID"
    t.integer  "cookID"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
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
  end

  create_table "shmtransactions", force: :cascade do |t|
    t.string   "payment_token"
    t.string   "client_token"
    t.string   "paymentType"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
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
    t.string   "userName"
    t.string   "userSurname"
    t.string   "userPhoneNumber"
    t.string   "userBlurb"
    t.string   "userInstructions"
    t.float    "homeAddressLat"
    t.float    "homeAddressLon"
    t.string   "profPicURL"
    t.integer  "lastMenuItemID"
    t.integer  "cookID"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
