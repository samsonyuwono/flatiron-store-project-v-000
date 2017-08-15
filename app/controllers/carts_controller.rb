class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    cart= Cart.find(params[:id])
    current_user.current_cart = nil
    redirect_to cart_path(cart)
  end
end
