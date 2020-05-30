# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  user_address :string
#  user_name    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer          not null
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:user) { build(:user) }
  let(:order) { build(:order, user: user) }

  context '正常系' do
    it 'be_valid' do
      expect(order).to be_valid
    end

    it 'set_histories' do
      expect(order).to be_valid
      expect(order.user_name).to eq user.name
      expect(order.user_address).to eq user.address
    end
  end
end
