class CartsController < ApplicationController
  def show
    @cart = find_cart
    @cart_items = @cart.cart_items.includes(:item)
  end

  private

  def find_cart
    if session[:cart_id]
      Cart.find_by(id: session[:cart_id]) || Cart.new
    else
      Cart.new
    end
  end
end