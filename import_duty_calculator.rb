# frozen_string_literal: true

require_relative 'tax_calculator'

class ImportDutyCalculator
  include TaxCalculator

  IMPORT_DUTY_RATE = 0.05

  def calculate(product)
    return 0 unless product.imported
    product.price * IMPORT_DUTY_RATE
  end
end
