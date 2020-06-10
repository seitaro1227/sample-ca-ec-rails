require 'spec_helper'

RSpec.describe TransactionOrder, type: :interactor do
  let(:user) { build_stubbed(:user, name: "test_name") }
  let(:products) { build_stubbed_list(:product, 3) }
  let(:params) {
    {
        param_user_id: 1,
        param_products: products.pluck(:id).map { {id: _1, count: 3} },
    }
  }
  subject(:context) { TransactionOrder.call(params) }
  describe '.call' do
    before do
      allow(User).to receive(:find).and_return(user)
      allow(Product).to receive(:find).and_return(products)
    end

    context '正常系' do
      it 'succeeds ' do
        expect(context).to be_a_success
      end
    end
  end
end
