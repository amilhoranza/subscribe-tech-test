# frozen_string_literal: true

require_relative '../receipt'
require_relative '../aggregated_tax_calculator'
require_relative '../basic_sales_tax_calculator'
require_relative '../import_duty_calculator'
require_relative '../basket'
require_relative '../product'

RSpec.describe Receipt do
  let(:basic_tax_calculator) { BasicSalesTaxCalculator.new }
  let(:import_duty_calculator) { ImportDutyCalculator.new }
  let(:aggregated_calculator) { AggregatedTaxCalculator.new([basic_tax_calculator, import_duty_calculator]) }

  context 'when calculating totals and taxes' do
    it 'calculates total taxes and price correctly for valid products' do
      basket = Basket.new
      product = Product.new(name: 'imported bottle of perfume', price: 47.50, quantity: 1, imported: true)
      basket.add_product(product)

      receipt = Receipt.new(basket, aggregated_calculator)
      expect { receipt.print }.to output(/Sales Taxes: 7.15/).to_stdout
      expect { receipt.print }.to output(/Total: 54.65/).to_stdout
    end
  end

  context 'when basket is empty' do
    it 'raises an error and prints a warning message' do
      basket = Basket.new

      expect {
        Receipt.new(basket, aggregated_calculator)
      }.to raise_error('Basket cannot be empty').and output(/No products in the basket to generate a receipt/).to_stdout
    end
  end

  context 'when tax calculation fails' do
    it 'handles the error and prints a message for failed tax calculation' do
      basket = Basket.new
      product = Product.new(name: 'imported bottle of perfume', price: 47.50, quantity: 1, imported: true)
      basket.add_product(product)

      # Mocking the tax calculator to raise an error
      broken_calculator = double('TaxCalculator')
      allow(broken_calculator).to receive(:calculate).and_raise(StandardError.new('Calculation error'))

      receipt = Receipt.new(basket, broken_calculator)

      expect { receipt.print }
        .to output(/Failed to calculate tax for product: imported bottle of perfume, error: Calculation error/).to_stdout
    end
  end
end
