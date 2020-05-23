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
  let(:product) { build(:product) }

  context '正常系' do
    it 'be_valid' do
      expect(product).to be_valid
    end
  end
end
