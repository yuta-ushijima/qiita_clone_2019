FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { "MyString" }
    password { "MyString" }
    article { nil }
  end
end
