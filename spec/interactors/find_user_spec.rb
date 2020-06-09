require 'spec_helper'

RSpec.describe FindUser, type: :interactor do
  let(:params) {
    {
        param_user_id: 1
    }
  }
  subject(:context) { FindUser.call(params) }
  describe '.call' do
    let(:user) { instance_double(User) }
    before do
      allow(User).to receive(:find).with(1).and_return(user)
    end

    context '正常系' do
      it 'succeeds ' do
        expect(context).to be_a_success
      end
      it 'user' do
        expect(context.user).to eq(user)
      end
    end

    context '存在しないユーザー' do
      before do
        allow(User).to receive(:find).with(1).and_raise(ActiveRecord::RecordNotFound)
      end

      it "fails" do
        expect(context).to be_a_failure
      end
      it 'user' do
        expect(context.user).to be_nil
      end

      it 'fail message' do
        expect(context.message).to eq('ユーザが存在しない')
      end
    end
  end
end
