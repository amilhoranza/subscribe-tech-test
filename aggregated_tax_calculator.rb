# frozen_string_literal: true

require_relative 'tax_calculator'

class AggregatedTaxCalculator
  include TaxCalculator

  def initialize(tax_calculators = [])
    @tax_calculators = tax_calculators
  end

  def calculate(product)
    total_tax = 0
    @tax_calculators.each do |calculator|
      total_tax += calculator.calculate(product)
    end
    round_up_tax(total_tax)
  end

  private

  NEAREST_MULTIPLE = 0.05

  def round_up_tax(tax)
    (tax / NEAREST_MULTIPLE).ceil * NEAREST_MULTIPLE
  end
end
