# frozen_string_literal: true

require_relative 'tax_calculator'

class BasicSalesTaxCalculator
  include TaxCalculator

  BASIC_SALES_TAX_RATE = 0.10

  def calculate(product)
    return 0 if product.exempt
    product.price * BASIC_SALES_TAX_RATE
  end
end
