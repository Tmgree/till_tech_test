require_relative 'menu'
require_relative 'receipt'

class Orders
  attr_reader :items, :current_order, :current_price
  def initialize()
   @current_order = [];
   @current_price = 0;
  end

  def add_item(menu, item, quantity)
    if menu.items["prices"][0].include?(item)
      quantity.times do
       current_order << item
     end
     add_money(menu,item, quantity)
     add_tax(menu,item, quantity)
     else
       raise 'Error you must select an item on the menu'
     end
  end

  def add_money(menu,item, quantity)
    @current_price += menu.items["prices"][0][item] * quantity
    @current_price = @current_price.round(2)
  end

  def add_tax(menu,item, quantity)
    tax = ((menu.items["prices"][0][item] * quantity) * 8.64/100).round(2)
    @current_price += tax
    @current_price = @current_price.round(2)
  end

end
