# frozen_string_literal: true

# Tax calculator abstractions
module TaxCalculator
  def calculate(product)
    raise NotImplementedError, 'This method should be implemented in the subclass'
  end
end
