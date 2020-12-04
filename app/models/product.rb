class Product < ApplicationRecord
    has_many :users, through: :carts
    belongs_to :cart, optional: true
    belongs_to :category, optional: true

    validates :name, presence: true
    validates :price, presence: true
    validates :stock, length: {minimum: 0}
end
