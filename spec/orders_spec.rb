require 'orders'
require 'menu'

describe Orders do

    it 'Should allow a user to add an item to their order' do
        menu = Menu.new
        order = Orders.new
        order.add_item(menu, "Tea", 1)
        expect(order.current_order).to include("Tea")
      end

      it 'Should throw an error if an item is not on the menu' do
          menu = Menu.new
          order = Orders.new
          expect{order.add_item(menu, "Curry", 1)}.to raise_error("Error you must select an item on the menu")
        end

      it 'Should allow a user to add a quantity of a given item' do
        menu = Menu.new
        order = Orders.new
        order.add_item(menu, "Tea", 2)
        expect(order.current_order).to eq(["Tea", "Tea"])
      end

      it 'Should initialize with a current price of 0' do
          order = Orders.new
          expect(order.current_price).to equal(0)
      end

      it 'Should add the correct amount to the total price' do
          menu = Menu.new
          order = Orders.new
          order.add_money(menu,"Tea", 3)
          expect(order.current_price).to equal(10.95)
      end

      it 'Should add the correct amount to the total price' do
          menu = Menu.new
          order = Orders.new
          order.add_tax(menu,"Tea", 3)
          expect(order.current_price).to equal(0.95)
      end

      it 'Should give the correct total price including tax' do
          menu = Menu.new
          order = Orders.new
          order.add_item(menu,"Tea", 3)
          expect(order.current_price).to equal(11.90)
      end

end
