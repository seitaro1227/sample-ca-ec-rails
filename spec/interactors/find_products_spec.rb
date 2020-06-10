require 'spec_helper'

RSpec.describe FindProducts, type: :interactor do
  let(:products) {
    build_stubbed_list(:product, 3)
  }
  let(:params) {
    {
        param_user_id: 1,
        param_products: products.pluck(:id).map { {id: _1, count: 3} },
    }
  }
  subject(:context) { FindProducts.call(params) }
  describe '.call' do
    let(:user) { instance_double(Product) }
    before do
      allow(Product).to receive(:find).with(products.map(&:id)).and_return(products)
    end

    context '正常系' do
      it 'succeeds ' do
        expect(context).to be_a_success
      end
      it 'products' do
        expect(context.products).to eq(products)
      end
    end

    context '存在しない商品' do
      before do
        allow(Product).to receive(:find).with(products.map(&:id)).and_raise(ActiveRecord::RecordNotFound)
      end

      it "fails" do
        expect(context).to be_a_failure
      end
      it 'products' do
        expect(context.products).to be_nil
      end

      it 'fail message' do
        expect(context.message).to eq('商品が存在しない')
      end
    end
  end
end
