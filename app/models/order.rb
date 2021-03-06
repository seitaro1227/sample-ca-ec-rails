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
class Order < ApplicationRecord
  belongs_to :user
  has_many :order_product_items
  has_many :products, through: :order_product_items
  accepts_nested_attributes_for :order_product_items
  # history系は分けるべき?
  validates :user_address, presence: true
  validates :user_name, presence: true
  validates :order_product_items, length: {minimum: 1}

  before_validation :set_histories

  private

  def set_histories
    self.user_name = self.user.name
    self.user_address = self.user.address
  end
end
