class OrderController < ApplicationController
    def new
        cart = Cart.find_or_create_by(user: current_user)
        @items = Item.where(cart: cart)
        render 'orders/new'
    end
end
