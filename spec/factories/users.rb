# == Schema Information
#
# Table name: users
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
  factory :user do
    name { "ユーザー" }
    address_1 { "北海道" }
    address_2 { "user_address_2 1-2-3" }
    address_3 { "user_address_3 #456" }
  end
end
