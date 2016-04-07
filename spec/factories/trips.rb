FactoryGirl.define do
  factory :trip do
    destination { Faker::Address.country }
    start_date { Faker::Date.forward(23) }
    end_date { Faker::Date.forward(23) + 23 }
    comment { Faker::Lorem.sentence }
  end
end
