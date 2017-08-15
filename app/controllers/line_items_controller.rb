class LineItemsController < ApplicationController

  def create
    current_user.current_cart= Cart.new unless current_user.current_cart
    current_user.save
  end

end
