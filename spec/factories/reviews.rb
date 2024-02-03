FactoryBot.define do
  factory :review do
    comment { "MyString" }
    rate { 1 }
    user { nil }
    movie { nil }
  end
end
