class ProductsController < ApplicationController
    def index
        @category = Category.find(params[:category_id])
        @products = @category.products.order(:price)
    end
end