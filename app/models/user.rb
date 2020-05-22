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
class User < ApplicationRecord
  validate :address_1, presence: true
  validate :address_2, presence: true
  validate :address_3, presence: true
  validate :name, presence: true
end
