class Cart < ActiveRecord::Base

  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items


  def add_item(item_id)
    item = line_items.find_by(item_id: item_id)
    if item
      item.quantity += 1
    else
      item= line_items.build(item_id: item_id)
    end
    item
  end

  def total
    @total = 0
    self.line_items.each do |i|
      @total+= i.item.price * i.quantity
      end
    @total
  end


  def checkout
    self.status = "submitted"
    change_inventory
  end

  def change_inventory
    self.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    self.status = "submitted"
    self.save
  end


end
