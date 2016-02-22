require_relative 'orders'

class Receipt

  def final_items(order)
    order.current_order
  end


end
