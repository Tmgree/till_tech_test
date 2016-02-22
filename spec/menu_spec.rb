require 'menu'

describe Menu do

  it 'Should initialize with a list of possible items' do
      menu = Menu.new
      expect(menu.items["prices"]).not_to be_empty
    end

end
