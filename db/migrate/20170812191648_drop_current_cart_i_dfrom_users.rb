class DropCurrentCartIDfromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :current_cart_id
  end
end
