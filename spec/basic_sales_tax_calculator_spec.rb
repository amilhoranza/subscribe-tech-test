# frozen_string_literal: true

require_relative '../basic_sales_tax_calculator'
require_relative '../product'
require_relative '../exemption_service'

RSpec.describe BasicSalesTaxCalculator do
  let(:basic_calculator) { BasicSalesTaxCalculator.new }
  let(:exemption_service) { ExemptionService.new }

  it 'applies tax to non-exempt products' do
    product = Product.new(name: 'music CD', price: 14.99, quantity: 1, exemption_service: exemption_service)
    expect(basic_calculator.calculate(product)).to be_within(0.01).of(1.50)
  end

  it 'does not apply tax to exempt products' do
    product = Product.new(name: 'book', price: 12.49, quantity: 1, exemption_service: exemption_service)
    expect(basic_calculator.calculate(product)).to eq(0.0)
  end
end
