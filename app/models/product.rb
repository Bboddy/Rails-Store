class Product < ApplicationRecord
    has_many :users, through: :carts
    belongs_to :cart, class_name: "cart", foreign_key: "cart_id"
    belongs_to :product, class_name: "product", foreign_key: "product_id"

    validates :title, presence :true
    validates :price, presence :true
    validates :stock, length: {minimum: 0}
end
