# Sales Tax Calculator

This is a Ruby-based project that calculates sales taxes for a set of shopping baskets based on predefined tax rules. 
The project follows **SOLID principles** and uses **composition** to handle multiple tax calculators.

## Features
- Basic sales tax: 10% applied to all non-exempt goods.
- Import duty: 5% applied to all imported goods.
- Rounding rule: Sales tax is rounded up to the nearest 0.05.
- Exemptions: Certain items (e.g., books, food, medical products) are exempt from basic sales tax.

## Assumptions
- **Exempt Products**: The list of exempt products includes books, food, and medical products. This list can be customized by passing it to the `ExemptionService`.
- **Input Format**: The input is expected to follow the format `X item_name at price`, where `X` is the quantity and `item_name` is the name of the product.
- **Rounding**: All sales taxes are rounded up to the nearest 0.05 as per the problem description.
- **Tax Calculations**: Different types of tax calculators (e.g., basic sales tax, import duty) are combined using a composite structure.

## Requirements

- **Ruby 3.3.5** (or newer)
- **Bundler** for managing dependencies
- **RSpec** for running tests

## Getting Started

### Clone the Repository

```bash
git clone https://github.com/amilhoranza/subscribe-tech-test.git
cd subscribe-tech-test
```
## Install Dependencies

```bash
bundle install
```

## Running the Application
You can run the application by executing the main.rb file, which processes multiple shopping baskets:

```bash
bundle exec ruby main.rb
```

### Example of input:

```
2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85
```

## Example of the output:

```
2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32
```

## Running the Tests
The project includes a comprehensive test suite using RSpec. To run the tests, simply use:

```bash
bundle exec rspec
```

## Project Structure

* product.rb: Represents a product with attributes such as name, price, quantity, and tax exemption status.
* basic_sales_tax_calculator.rb: Calculates the basic sales tax for non-exempt products.
* import_duty_calculator.rb: Calculates the import duty for imported products.
* aggregated_tax_calculator.rb: Combines multiple tax calculators to compute the total tax.
* receipt.rb: Generates and prints a receipt, including sales taxes and total cost.
* basket.rb: Holds the list of products.
* input_parser.rb: Parses input strings into Product objects and adds them to a Basket.
* exemption_service.rb: Provides a service to determine whether a product is exempt from basic sales tax.
