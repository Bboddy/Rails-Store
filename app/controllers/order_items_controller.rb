class OrderItemsController < ApplicationController
    def create
        current_cart.add_item(
            product_id: params[:product_id],
            quanity: params[:quanity]
        )

        redirect_to cart_path
    end
end