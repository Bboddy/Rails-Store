class Order < ApplicationRecord
    belongs_to :user, class_name: "user", foreign_key: "user_id"

    validates :address presence: true
    validates_format_of :address, :with => /^[a-zA-Z\d ]*$/i #only includes letters and numbers and spaces
    validates :total_price presence: true
    validates :shipping_time presence: true

    t.string "address"
    t.decimal "total_price"
    t.string "shipping_time" 
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
end
