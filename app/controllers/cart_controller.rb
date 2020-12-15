class CartController < ApplicationController
    def index
        
    end

    def create
        cart = Cart.find_or_create_by(user: current_user)
        product = Product.find(params[:product_id])
        item = Item.find_or_create_by(product: product, cart: cart, quanity: params[:quanity])
        cart.total_price = (i.product.price.to_i * i.quanity.to_i)
        redirect_to cart_path(cart.id)
    end

    def show
        @cart = Cart.find_or_create_by(user: current_user)
        @items = Item.where(cart: @cart)
        render 'carts/show'
    end

    def update
        cart = Cart.find_or_create_by(user: current_user)
        product = Product.find(params[:product_id])
        item = Item.find_or_create_by(product: product, cart: cart)
        total = 0
        items = Item.where(cart: cart)
        items.each do |i|
            total += (i.product.price.to_i * i.quanity.to_i)
        end
        if item_params[:quanity].to_i < 1
            item.destroy
        else
            item.update(item_params)
            cart.update(total_price: total.to_i)
        end
        redirect_to cart_path(cart.id)
    end

    private

    def item_params
        params.require(:item).permit(:quanity)
    end
end