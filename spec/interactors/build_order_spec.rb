require 'spec_helper'

RSpec.describe BuildOrder, type: :interactor do
  let(:user) { build_stubbed(:user) }
  let(:products) { build_stubbed_list(:product, 3) }
  let(:request_context) {
    {
        param_user_id: user.id,
        param_products: products.pluck(:id).map { {id: _1, count: 3} },
        user: user,
        products: products
    }
  }
  subject(:context) { BuildOrder.call(request_context) }
  describe '.call' do
    context '正常系' do
      it 'succeeds ' do
        expect(context).to be_a_success
      end

      it 'order' do
        expect(context.order).to be_valid
      end
    end
  end
end
