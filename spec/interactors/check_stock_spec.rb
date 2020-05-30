require 'spec_helper'

RSpec.describe CheckStock, type: :interactor do
  let(:product) { create(:product) }
  let(:params) { {user_id: 1, products: [{id: product.id, count: product.count}]} }
  subject(:context) { CheckStock.call(params) }
  describe '.call' do

    context '正常系' do
      it 'succeeds ' do
        expect(context).to be_a_success
      end
    end
  end
end
