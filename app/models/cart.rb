class Cart < ApplicationRecord
    belongs_to :user
    has_many :products
    belongs_to :order, optional: true

    # def initialize()

    # end

    # def add_item(product_id:)
    #     product = Product.find(product_id)
    #     order_item = order.items.find_or_create_by(product_id: product_id)

    #     order_item.price = product.price
    #     order_item.quanity = quanity
    #     order_item.save
    # end
end