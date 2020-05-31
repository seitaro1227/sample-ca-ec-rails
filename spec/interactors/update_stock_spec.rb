require 'spec_helper'

RSpec.describe UpdateStock, type: :interactor do
  subject(:context) { # p params
    UpdateStock.call({products: [{id: 1, count: 1}]})
  }
  describe '.call' do
    let(:product) { spy(:product) }
    before do
      allow(Product).to receive(:where).and_return([product])
      allow(product).to receive(:save).and_return(true)
      allow(product).to receive(:subtraction_stock).and_return(product)
    end
    context '正常系' do
      it 'succeeds ' do
        expect(context).to be_a_success
      end

      it 'call product method' do
        context
        expect(product).to have_received(:subtraction_stock)
        expect(product).to have_received(:save)
      end
    end
  end
end
