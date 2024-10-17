# frozen_string_literal: true

class InputParser
  attr_reader :exemption_service

  def initialize(exemption_service = ExemptionService.new)
    @exemption_service = exemption_service
  end

  def parse(input)
    basket = Basket.new

    input.each_line do |line|
      match_data = line.match(/(\d+) (.+) at (\d+\.\d{2})/)
      quantity = match_data[1].to_i
      name = match_data[2]
      price = match_data[3].to_f

      imported = name.include?('imported')

      product = Product.new(
        name: name,
        price: price,
        quantity: quantity,
        imported: imported,
        exemption_service: exemption_service
      )

      basket.add_product(product)
    end

    basket
  end
end
