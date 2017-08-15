class ItemsController < ApplicationController

  def item
    @item= Item.find(params[:id])
  end

end
