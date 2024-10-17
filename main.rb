# frozen_string_literal: true

require_relative 'product'
require_relative 'basic_sales_tax_calculator'
require_relative 'import_duty_calculator'
require_relative 'aggregated_tax_calculator'
require_relative 'receipt'
require_relative 'basket'
require_relative 'input_parser'
require_relative 'exemption_service'

input_1 = <<~INPUT
  2 book at 12.49
  1 music CD at 14.99
  1 chocolate bar at 0.85
INPUT

input_2 = <<~INPUT
  1 imported box of chocolates at 10.00
  1 imported bottle of perfume at 47.50
INPUT

input_3 = <<~INPUT
  1 imported bottle of perfume at 27.99
  1 bottle of perfume at 18.99
  1 packet of headache pills at 9.75
  3 imported boxes of chocolates at 11.25
INPUT

parser = InputParser.new

basic_tax_calculator = BasicSalesTaxCalculator.new
import_duty_calculator = ImportDutyCalculator.new
aggregated_tax_calculator = AggregatedTaxCalculator.new([basic_tax_calculator, import_duty_calculator])

inputs = [input_1, input_2, input_3]

inputs.each do |input|
  basket = parser.parse(input)
  receipt = Receipt.new(basket, aggregated_tax_calculator)
  receipt.print
  puts "\n"
end
