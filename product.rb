# frozen_string_literal: true

class Product
  attr_reader :name, :price, :quantity, :imported, :exempt, :exemption_service

  def initialize(name:, price:, quantity:, imported: false, exemption_service: nil)
    @name = name
    @price = price
    @quantity = quantity
    @imported = imported
    @exempt = exemption_service&.exempt?(name) || false
  end
end
