# frozen_string_literal: true

require_relative '../input_parser'
require_relative '../product'
require_relative '../basket'

RSpec.describe InputParser do
  let(:parser) { InputParser.new }

  it 'parses input and creates products correctly' do
    input = "2 book at 12.49\n9 music CD at 14.99\n11 chocolate bar at 0.85"
    basket = parser.parse(input)

    expect(basket.products.size).to eq(3)
    expect(basket.products[0].name).to eq('book')
    expect(basket.products[0].price).to eq(12.49)
    expect(basket.products[0].quantity).to eq(2)
    expect(basket.products[1].name).to eq('music CD')
    expect(basket.products[1].price).to eq(14.99)
    expect(basket.products[1].quantity).to eq(9)
    expect(basket.products[2].name).to eq('chocolate bar')
    expect(basket.products[2].price).to eq(0.85)
    expect(basket.products[2].quantity).to eq(11)
  end
end
