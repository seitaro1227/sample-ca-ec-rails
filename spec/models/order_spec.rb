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
  let(:order) { build(:order) }

  context '正常系' do
    it 'be_valid' do
      expect(order).to be_valid
    end
  end
end
