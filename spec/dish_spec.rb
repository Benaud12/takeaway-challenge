require 'dish'

describe Dish do

  describe '#new' do
    it 'accepts two arguments when initializing, name and price' do
      expect{ Dish.new("Dishy", 1.23) }.not_to raise_error
    end
  end

end
