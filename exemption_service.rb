# frozen_string_literal: true

class ExemptionService
  def initialize(exempt_products = [])
    @exempt_products = exempt_products
  end

  def exempt?(product_name)
    @exempt_products.any? { |exempt| product_name.include?(exempt) }
  end
end
