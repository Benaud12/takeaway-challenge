require 'menu'

describe Menu do

  let(:dish1){double(:dish1, name: "Dishy1", price: 1.11)}
  let(:dish2){double(:dish2, name: "Dishy2", price: 2.22)}
  let(:dish3){double(:dish3, name: "Dishy3", price: 3.33)}

  describe '#add' do
    it 'adds a new dish to the menu' do
      subject.add(dish1)
      expect(subject.dishes_available.values.include?(dish1)).to be true
    end
  end

  describe '#view' do
    it 'lists dishes available with price' do
      subject.add(dish1)
      expect{ subject.view }.to output("1: Dishy1 | Price: £1.11\n").to_stdout
    end

    it 'lists multiple dishes with unique order numbers' do
      subject.add(dish1)
      subject.add(dish2)
      subject.add(dish3)
      expected_output = "1: Dishy1 | Price: £1.11\n2: Dishy2 | Price: £2.22\n3: Dishy3 | Price: £3.33\n"
      expect{ subject.view }.to output(expected_output).to_stdout
    end

    it 'raises an error if no dishes available' do
      expect{ subject.view }.to raise_error "No meal options have been added to this menu"
    end
  end

end