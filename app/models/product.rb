# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  count      :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Product < ApplicationRecord
  has_many :order_product_items
  validates :count, numericality: { only_integer: true ,greater_than_or_equal_to: 0}
  validates :name, presence: true
end
