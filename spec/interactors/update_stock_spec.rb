require 'spec_helper'

RSpec.describe UpdateStock, type: :interactor do
  let!(:product){create(:product)}
  subject(:context) { UpdateStock.call({products: [{id: product.id, count: 1}]}) }
  describe '.call' do
    context '正常系' do
      it 'succeeds ' do
        expect(context).to be_a_success
      end

      it 'product.count' do
        fetch_product = Product.find(product.id)
        expect(fetch_product.id).to eq product.count - 1
      end
    end
  end
end
