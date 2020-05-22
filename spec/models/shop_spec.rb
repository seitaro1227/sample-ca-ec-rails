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
require 'rails_helper'

RSpec.describe Shop, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
