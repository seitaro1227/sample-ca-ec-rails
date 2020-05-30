# == Schema Information
#
# Table name: order_product_items
#
#  id           :integer          not null, primary key
#  count        :integer
#  product_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  order_id     :integer          not null
#  product_id   :integer          not null
#
# Indexes
#
#  index_order_product_items_on_order_id    (order_id)
#  index_order_product_items_on_product_id  (product_id)
#
# Foreign Keys
#
#  order_id    (order_id => orders.id)
#  product_id  (product_id => products.id)
#
require 'rails_helper'

RSpec.describe OrderProductItem, type: :model do
  let(:order) { build(:order) }
  let(:product) { build(:product) }
  let(:order_product_item) { build(:order_product_item, order: order, product: product) }

  context '正常系' do
    it 'be_valid' do
      expect(order_product_item).to be_valid
    end
    it 'set_histories' do
      expect(order_product_item).to be_valid
      expect(order_product_item.product_name).to eq product.name
    end
  end
end
