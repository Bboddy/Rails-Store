class Product < ApplicationRecord
    has_many :users, through: :carts
    belongs_to :cart, class_name: "cart", foreign_key: "cart_id"
end
