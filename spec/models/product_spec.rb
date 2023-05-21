# frozen_string_literal: true

describe Product do
  context 'when saved' do
    let(:product) { create(:product) }

    it 'has a name' do
      expect(product.name).to be_present
    end

    it 'has a price' do
      expect(product.price).to be_present
    end
  end
end
