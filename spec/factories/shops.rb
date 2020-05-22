# == Schema Information
#
# Table name: shops
#
#  id         :integer          not null, primary key
#  address_1  :string
#  address_2  :string
#  address_3  :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :shop do
    name { "店舗名" }
    address_1 { "千葉県" }
    address_2 { "address_2 1-2-3" }
    address_3 { "address_3 building 456" }
  end
end
