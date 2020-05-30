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
FactoryBot.define do
  factory :order do
    user_name { nil }
    user_address { nil }

    before(:build){ |order|
      order.user = build(:user)
      order.order_product_items = build_list(:order_product_item, 3)
    }
  end
end
