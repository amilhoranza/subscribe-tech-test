# frozen_string_literal: true

class Receipt
  def initialize(basket, tax_calculator)
    @basket = basket
    @tax_calculator = tax_calculator
    validate_products
  end

  def print
    total_price = 0
    total_sales_tax = 0

    @basket.products.each do |product|
      begin
        sales_tax = @tax_calculator.calculate(product)
        total_price_with_tax = product.price + sales_tax

        total_price += total_price_with_tax * product.quantity
        total_sales_tax += sales_tax * product.quantity

        puts "#{product.quantity} #{product.name}: #{'%.2f' % (total_price_with_tax * product.quantity)}"
      rescue StandardError => e
        puts "Failed to calculate tax for product: #{product.name}, error: #{e.message}"
      end
    end

    puts "Sales Taxes: #{'%.2f' % total_sales_tax}"
    puts "Total: #{'%.2f' % total_price}"
  end

  private

  def validate_products
    if @basket.products.empty?
      puts 'No products in the basket to generate a receipt'
      raise 'Basket cannot be empty'
    end
  end
end
