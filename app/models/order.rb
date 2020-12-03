class Order < ApplicationRecord
    belongs_to :user, class_name: "user", foreign_key: "user_id"

    validates :address presence: true
    validates_format_of :address, :with => /^[a-zA-Z\d ]*$/i #only includes letters and numbers and spaces
    validates :total_price presence: true
    validates :shipping_time presence: true
end
