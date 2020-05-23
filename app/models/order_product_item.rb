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
class OrderProductItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  # history系は分けるべき?
  validates :count, numericality: { only_integer: true ,greater_than: 0}
  validates :product_name, presence: true
end
