FactoryGirl.define do
  factory :solution do
    result { {} }
    date { Faker::Date.forward(23) }
  end
end
