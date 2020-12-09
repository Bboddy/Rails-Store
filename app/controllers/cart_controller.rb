class CartController < ApplicationController
    def index
        
    end

    def create
        @cart = Cart.find_or_create_by(user: current_user)
        @product = Product.find(params[:product_id])
        @item = Item.find_or_create_by(product: @product, cart: @cart)
        @item.update(quanity: params[:quanity])

        # redirect_to cart_path(@cart.id)
    end

    def show
        @cart = Cart.find_or_create_by(user: current_user)
        @items = Item.where(cart: @cart)
        render 'carts/show'
    end

    def update
        
    end
end