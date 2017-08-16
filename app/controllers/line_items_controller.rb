class LineItemsController < ApplicationController

  def create
    current_user.current_cart= Cart.new unless current_user.current_cart
    current_user.save
    line_item= current_user.current_cart.add_item(params[:item_id])
    if line_item.save
      redirect_to cart_path(current_user.current_cart)
       flash[:notice] = 'Item sucessfully added to cart!'
    else
      redirect_to store_path
    end
  end

end
