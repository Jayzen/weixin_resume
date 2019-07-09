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

ActiveRecord::Schema.define(version: 2019_07_09_030533) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "affair_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.integer "guest_id"
    t.integer "affair_id"
    t.boolean "reveal", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["affair_id"], name: "index_affair_comments_on_affair_id"
    t.index ["guest_id"], name: "index_affair_comments_on_guest_id"
  end

  create_table "affair_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "pic"
    t.integer "user_id"
    t.integer "affair_id"
    t.integer "order", default: 0
    t.boolean "reveal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["affair_id"], name: "index_affair_images_on_affair_id"
    t.index ["user_id"], name: "index_affair_images_on_user_id"
  end

  create_table "affairs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "order", default: 0
    t.boolean "reveal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
    t.index ["product_id"], name: "index_affairs_on_product_id"
    t.index ["user_id"], name: "index_affairs_on_user_id"
  end

  create_table "appointments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "contact"
    t.string "date"
    t.string "time"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "banner_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "pic"
    t.integer "user_id"
    t.integer "banner_id"
    t.integer "order", default: 0
    t.boolean "reveal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["banner_id"], name: "index_banner_items_on_banner_id"
    t.index ["user_id"], name: "index_banner_items_on_user_id"
  end

  create_table "banners", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "basics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.boolean "is_name", default: true
    t.string "avatar"
    t.boolean "is_avatar", default: true
    t.string "motto"
    t.boolean "is_motto", default: true
    t.text "introduction"
    t.boolean "is_introduction", default: true
    t.string "phone"
    t.boolean "is_phone", default: true
    t.string "wechat"
    t.boolean "is_wechat", default: true
    t.string "qq"
    t.boolean "is_qq", default: true
    t.string "email"
    t.boolean "is_email", default: true
    t.string "company"
    t.boolean "is_company", default: true
    t.string "job"
    t.boolean "is_job", default: true
    t.string "address"
    t.boolean "is_address", default: true
    t.integer "visit", default: 0
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_basics_on_user_id"
  end

  create_table "carousels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "pic"
    t.integer "order", default: 0
    t.integer "user_id"
    t.boolean "reveal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "photograph_id"
    t.index ["photograph_id"], name: "index_carousels_on_photograph_id"
    t.index ["user_id"], name: "index_carousels_on_user_id"
  end

  create_table "clients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "guest_id"
    t.integer "user_id"
    t.text "content"
    t.boolean "reveal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_comments_on_guest_id"
  end

  create_table "consults", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "contact"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
    t.index ["user_id"], name: "index_consults_on_user_id"
  end

  create_table "contacts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "telephone"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "guests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "openid"
    t.string "nickname"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "home_photograph_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "pic"
    t.integer "photograph_id"
    t.integer "user_id"
    t.integer "order", default: 0
    t.boolean "reveal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photograph_id"], name: "index_home_photograph_categories_on_photograph_id"
    t.index ["user_id"], name: "index_home_photograph_categories_on_user_id"
  end

  create_table "home_photographs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "pic"
    t.integer "user_id"
    t.integer "tap_photograph_id"
    t.integer "order", default: 0
    t.boolean "reveal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tap_photograph_id"], name: "index_home_photographs_on_tap_photograph_id"
    t.index ["user_id"], name: "index_home_photographs_on_user_id"
  end

  create_table "hot_words", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "order", default: 0
    t.boolean "reveal"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hot_words_on_user_id"
  end

  create_table "independent_carousels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "pic"
    t.integer "order", default: 0
    t.integer "user_id"
    t.boolean "reveal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_independent_carousels_on_user_id"
  end

  create_table "like_affairs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "guest_id"
    t.integer "affair_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["affair_id"], name: "index_like_affairs_on_affair_id"
    t.index ["guest_id"], name: "index_like_affairs_on_guest_id"
  end

  create_table "locations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "latitude"
    t.string "longitude"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "menu_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "pic"
    t.integer "order", default: 0
    t.boolean "reveal"
    t.integer "menu_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_menu_details_on_menu_id"
    t.index ["user_id"], name: "index_menu_details_on_user_id"
  end

  create_table "menus", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "pic"
    t.integer "order", default: 0
    t.boolean "reveal"
    t.string "price"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_menus_on_user_id"
  end

  create_table "merchant_basic_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "pic"
    t.integer "user_id"
    t.integer "merchant_basic_id"
    t.integer "order", default: 0
    t.boolean "reveal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchant_basic_id"], name: "index_merchant_basic_images_on_merchant_basic_id"
    t.index ["user_id"], name: "index_merchant_basic_images_on_user_id"
  end

  create_table "merchant_basics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "duty"
    t.boolean "is_wifi"
    t.boolean "is_parking"
    t.boolean "is_wechat_pay"
    t.boolean "is_alipay"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "phone"
    t.string "avatar"
    t.text "description"
    t.index ["user_id"], name: "index_merchant_basics_on_user_id"
  end

  create_table "merchant_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "pic"
    t.integer "order", default: 0
    t.integer "user_id"
    t.boolean "reveal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_merchant_images_on_user_id"
  end

  create_table "movies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.string "movie"
    t.integer "order", default: 0
    t.boolean "reveal"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_movies_on_user_id"
  end

  create_table "official_accounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "pic"
    t.integer "user_id"
    t.integer "order", default: 0
    t.boolean "reveal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_official_accounts_on_user_id"
  end

  create_table "photographs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "order", default: 0
    t.boolean "reveal"
    t.string "price"
    t.string "merit"
    t.string "age"
    t.string "clothing"
    t.string "picture"
    t.string "photographer"
    t.text "others"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pic"
    t.index ["user_id"], name: "index_photographs_on_user_id"
  end

  create_table "product_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "pic"
    t.integer "order", default: 0
    t.boolean "reveal"
    t.integer "product_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_details_on_product_id"
    t.index ["user_id"], name: "index_product_details_on_user_id"
  end

  create_table "product_homes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
    t.boolean "reveal"
    t.index ["product_id"], name: "index_product_homes_on_product_id"
    t.index ["user_id"], name: "index_product_homes_on_user_id"
  end

  create_table "product_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "pic"
    t.integer "order", default: 0
    t.boolean "reveal"
    t.integer "product_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_images_on_product_id"
    t.index ["user_id"], name: "index_product_images_on_user_id"
  end

  create_table "product_sorts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "product_id"
    t.integer "sort_id"
    t.integer "user_id"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_sorts_on_product_id"
    t.index ["sort_id", "product_id"], name: "index_product_sorts_on_sort_id_and_product_id", unique: true
    t.index ["sort_id"], name: "index_product_sorts_on_sort_id"
    t.index ["user_id"], name: "index_product_sorts_on_user_id"
  end

  create_table "product_themes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "theme_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order", default: 0
    t.integer "user_id"
    t.index ["theme_id", "product_id"], name: "index_product_themes_on_theme_id_and_product_id", unique: true
    t.index ["user_id"], name: "index_product_themes_on_user_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "pic"
    t.integer "order", default: 0
    t.boolean "reveal"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "current_price", precision: 5, scale: 2
    t.decimal "old_price", precision: 5, scale: 2
    t.integer "stock"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "recents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "pic"
    t.integer "photograph_id"
    t.integer "user_id"
    t.integer "order", default: 0
    t.boolean "reveal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photograph_id"], name: "index_recents_on_photograph_id"
    t.index ["user_id"], name: "index_recents_on_user_id"
  end

  create_table "sorts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "order", default: 0
    t.boolean "reveal"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sorts_on_user_id"
  end

  create_table "states", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "content"
    t.string "pic"
    t.integer "order", default: 0
    t.integer "user_id"
    t.boolean "reveal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tap_photograph_id"
    t.index ["tap_photograph_id"], name: "index_states_on_tap_photograph_id"
    t.index ["user_id"], name: "index_states_on_user_id"
  end

  create_table "tap_carousels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "pic"
    t.integer "order", default: 0
    t.integer "user_id"
    t.boolean "reveal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tap_carousels_on_user_id"
  end

  create_table "tap_photograph_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "pic"
    t.integer "user_id"
    t.integer "tap_photograph_id"
    t.integer "order", default: 0
    t.boolean "reveal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tap_photograph_id"], name: "index_tap_photograph_images_on_tap_photograph_id"
    t.index ["user_id"], name: "index_tap_photograph_images_on_user_id"
  end

  create_table "tap_photographs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "pic"
    t.integer "order", default: 0
    t.integer "user_id"
    t.boolean "reveal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tap_carousel_id"
    t.index ["tap_carousel_id"], name: "index_tap_photographs_on_tap_carousel_id"
    t.index ["user_id"], name: "index_tap_photographs_on_user_id"
  end

  create_table "themes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "home_pic"
    t.string "theme_pic"
    t.integer "order", default: 0
    t.integer "user_id"
    t.boolean "reveal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_themes_on_user_id"
  end

  create_table "tops", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "pic"
    t.datetime "weight"
    t.integer "user_id"
    t.boolean "reveal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tops_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "name"
    t.string "style"
    t.string "appkey"
    t.string "app_id"
    t.string "app_secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "roles"
    t.string "openid", default: "oxaRd5ZMUpZbwQYcvBFi75zVNTFg"
    t.string "merchant"
    t.string "merchant_key"
    t.string "merchant_id"
    t.index ["appkey"], name: "index_users_on_appkey", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "wedding_basics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.index ["user_id"], name: "index_wedding_basics_on_user_id"
  end

  create_table "workshop_basics", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "business_hour"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_workshop_basics_on_user_id"
  end

end
