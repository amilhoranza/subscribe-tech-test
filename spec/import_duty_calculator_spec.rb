# frozen_string_literal: true

require_relative '../import_duty_calculator'
require_relative '../product'
require_relative '../exemption_service'

RSpec.describe ImportDutyCalculator do
  let(:import_duty_calculator) { ImportDutyCalculator.new }
  let(:exemption_service) { ExemptionService.new }

  it 'applies import duty to imported products' do
    product = Product.new(
      name: 'imported bottle of perfume',
      price: 47.50,
      quantity: 1,
      imported: true,
      exemption_service: exemption_service
    )
    expect(import_duty_calculator.calculate(product)).to be_within(0.01).of(2.38)
  end

  it 'does not apply import duty to non-imported products' do
    product = Product.new(
      name: 'bottle of perfume',
      price: 18.99,
      quantity: 1,
      imported: false,
      exemption_service: exemption_service
    )
    expect(import_duty_calculator.calculate(product)).to eq(0.0)
  end
end
