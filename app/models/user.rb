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
  validates :address_1, presence: true
  validates :address_2, presence: true
  validates :address_3, presence: true
  validates :name, presence: true

  def address
    "#{address_1} #{address_2} #{address_3}"
  end
end
