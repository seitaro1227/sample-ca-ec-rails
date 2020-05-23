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
  let(:shop) { build(:shop) }

  context '正常系' do
    it 'be_valid' do
      expect(shop).to be_valid
    end
  end
end
