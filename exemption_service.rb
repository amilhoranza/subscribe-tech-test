# frozen_string_literal: true

# Service that exempt some products from taxes
class ExemptionService
  EXEMPT_PRODUCTS = %w[book chocolate pill].freeze

  def exempt?(product_name)
    EXEMPT_PRODUCTS.any? { |exempt| product_name.include?(exempt) }
  end
end
