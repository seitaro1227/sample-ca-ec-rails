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
class Shop < ApplicationRecord
  validates :address_1, presence: true
  validates :address_2, presence: true
  validates :address_3, presence: true
  validates :name, presence: true
end
