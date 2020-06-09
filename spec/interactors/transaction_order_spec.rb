require 'spec_helper'

RSpec.describe TransactionOrder, type: :interactor do
  let(:params) { {user_id: 1, products: [{id: 1, count: 10}]} }
  subject(:context) { TransactionOrder.call(params) }
  describe '.call' do
    let(:user) { double(:user, name: "test_name") }
    let(:product) { double(:product, id: 1, count: 10) }
    before do
      allow(User).to receive(:find).with(1).and_return(user)
      allow(Product).to receive(:find).with(1).and_return(product)
    end

    context '正常系' do
      it 'succeeds ' do
        expect(context).to be_a_success
      end
      it 'user' do
        expect(context.user).to eq(user)
      end
    end
  end
end
