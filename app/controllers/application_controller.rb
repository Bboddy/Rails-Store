class ApplicationController < ActionController::Base
    before_action :current_cart
    def current_cart
        @current_cart ||= Cart.new
        @current_cart.user = current_user
    end
    helper_method :current_cart
end
