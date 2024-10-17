# frozen_string_literal: true

require_relative '../tax_calculator'
require_relative '../aggregated_tax_calculator'
require_relative '../basic_sales_tax_calculator'
require_relative '../import_duty_calculator'
require_relative '../product'
require_relative '../exemption_service'

RSpec.describe AggregatedTaxCalculator do
  let(:basic_tax_calculator) { BasicSalesTaxCalculator.new }
  let(:import_duty_calculator) { ImportDutyCalculator.new }
  let(:aggregated_calculator) { AggregatedTaxCalculator.new([basic_tax_calculator, import_duty_calculator]) }
  let(:exemption_service) { ExemptionService.new }

  it 'applies both taxes to imported non-exempt products' do
    product = Product.new(
      name: 'imported bottle of perfume',
      price: 47.50,
      quantity: 1,
      imported: true,
      exemption_service: exemption_service
    )
    expect(aggregated_calculator.calculate(product)).to eq(7.15) # 10% + 5% rounded
  end

  it 'applies only basic sales tax to non-imported, non-exempt products' do
    product = Product.new(name: 'music CD', price: 14.99, quantity: 1, exemption_service: exemption_service)
    expect(aggregated_calculator.calculate(product)).to eq(1.50) # Only 10% basic tax
  end

  it 'applies no taxes to exempt, non-imported products' do
    product = Product.new(name: 'book', price: 12.49, quantity: 1, exemption_service: exemption_service)
    expect(aggregated_calculator.calculate(product)).to eq(0.0)
  end
end
