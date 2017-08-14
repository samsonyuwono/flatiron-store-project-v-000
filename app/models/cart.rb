class Cart < ActiveRecord::Base

  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items


  def add_item(item_id)

  end

  def total
    @total = 0
    self.line_items.each do |i|
      @total+= i.item.price * i.quantity
    end
  @total
end

end
