# frozen_string_literal: true

module TaxCalculator
  def calculate(product)
    raise NotImplementedError, 'This method should be implemented in the subclass'
  end
end
