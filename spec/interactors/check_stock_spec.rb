require 'spec_helper'

RSpec.describe CheckStock, type: :interactor do
  let(:user) { build_stubbed(:user) }
  let(:products) { build_stubbed_list(:product, 3) }
  let(:params) {
    {
      param_user_id: user.id,
      param_products: products.pluck(:id).map { {id: _1, count: 3} },
      products: products
    }
  }
  let(:invalid_params) {
    {
        param_user_id: user.id,
        param_products: products.pluck(:id).map { {id: _1, count: 99} },
        products: products
    }
  }

  describe '.call' do
    context '正常系' do
      subject(:context) { CheckStock.call(params) }
      it 'succeeds ' do
        expect(context).to be_a_success
      end
    end
    context '異常系' do
      subject(:invalid_context) { CheckStock.call(invalid_params) }
      it 'fails' do
        expect(invalid_context).to be_a_failure
      end
      it 'message' do
        expect(invalid_context.message).to eq '在庫がない'
      end
    end
  end
end
