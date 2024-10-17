# frozen_string_literal: true

require_relative '../basket'
require_relative '../product'

RSpec.describe Basket do
  it 'can add products to the basket' do
    basket = Basket.new
    product = Product.new(name: 'book', price: 12.49, quantity: 1)

    basket.add_product(product)
    expect(basket.products.size).to eq(1)
    expect(basket.products.first).to eq(product)
  end
end
