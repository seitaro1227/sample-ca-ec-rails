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
require 'rails_helper'

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end