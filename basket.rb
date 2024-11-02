# frozen_string_literal: true

# Basket class
class Basket
  attr_reader :products

  def initialize
    @products = []
  end

  def add_product(product)
    @products << product
  end
end
