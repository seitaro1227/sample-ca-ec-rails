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
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  context '正常系' do
    it 'be_valid' do
      expect(user).to be_valid
    end
  end
end
