class Product < ApplicationRecord
    has_many :users, through: :carts
    belongs_to :cart, class_name: "cart", foreign_key: "cart_id", optional: true
    belongs_to :category, class_name: "category", foreign_key: "category_id", optional: true #Doesnt have to be optional

    validates :name, presence: true
    validates :price, presence: true
    validates :stock, length: {minimum: 0}
end
