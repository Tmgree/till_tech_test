require 'json'

class Menu
  attr_reader :items
  def initialize()
   file = File.read("hipstercoffee.json")
   @items = JSON.parse(file);
  end

end
