# frozen_string_literal: true

class ExemptionService
  EXEMPT_PRODUCTS = ['book', 'chocolate', 'pill']

  def exempt?(product_name)
    EXEMPT_PRODUCTS.any? { |exempt| product_name.include?(exempt) }
  end
end
