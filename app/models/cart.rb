class Cart < ActiveRecord::Base

  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items


  def add_item
    self.line_items.create(quantity: 1, cart: @cart)
  end

  def total

  end

end
