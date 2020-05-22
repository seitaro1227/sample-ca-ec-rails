FactoryBot.define do
  factory :order do
    user_name { "MyString" }
    user_address { "MyString" }
    user { nil }
  end
end
