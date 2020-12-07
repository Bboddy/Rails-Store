class Cart < ApplicationRecord
    belongs_to :user
    has_many :products
    belongs_to :order, optional: true

    def initialize(token:)
        @token = token
    end

    def order
        @order ||= Order.find_or_create_by(token: @token) do |order|
            order.total_price = 0
    end

    def add_item(product_id:, quanity: 1)
        product = Product.find(product_id)
        order_item = order.items.find_or_create_by(product_id: product_id)

        order_item.price = product.price
        order_item.quanity = quanity
        order_item.save
    end
end