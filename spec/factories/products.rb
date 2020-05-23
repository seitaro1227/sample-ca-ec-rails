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
FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "product_#{n}" }
    count { 10 }
  end
end
