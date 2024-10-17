# frozen_string_literal: true

require_relative '../product'
require_relative '../exemption_service'

RSpec.describe Product do
  context 'when creating a product' do
    let(:exemption_service) { ExemptionService.new(['book']) }

    it 'initializes with correct attributes' do
      product = Product.new(
        name: 'book',
        price: 12.49,
        quantity: 1,
        imported: false,
        exemption_service: exemption_service
      )

      expect(product.name).to eq('book')
      expect(product.price).to eq(12.49)
      expect(product.quantity).to eq(1)
      expect(product.imported).to be_falsey
      expect(product.exempt).to be_truthy
    end

    it 'detects non-exempt products correctly' do
      product = Product.new(name: 'music CD', price: 14.99, quantity: 1, exemption_service: exemption_service)

      expect(product.exempt).to be_falsey
    end
  end
end
