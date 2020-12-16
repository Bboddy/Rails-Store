class CartController < ApplicationController
    def index
        
    end

    def create # current_user ? current_user.name : 'Rails Store'
        cart = Cart.find_or_create_by(user: current_user)
        product = Product.find(params[:product_id])
        item = Item.find_or_create_by(product: product, cart: cart)
        item.quanity ? item.update(quanity: (item.quanity + params[:quantiy].to_i)) : item.update(quanity: params[:quantiy])
        update_total_price()
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
        
        if item_params[:quanity].to_i < 1
            item.destroy
            update_total_price()
        else
            item.update(item_params)
            update_total_price()
        end

        redirect_to cart_path(cart.id)
    end

    private

    def item_params
        params.require(:item).permit(:quanity)
    end

    def update_total_price
        cart = Cart.find_or_create_by(user: current_user)
        items = Item.where(cart: cart)
        total = 0
        
        items.each do |i|
            total += (i.product.price.to_i * i.quanity.to_i)
        end

        cart.update(total_price: total.to_i)
    end
end