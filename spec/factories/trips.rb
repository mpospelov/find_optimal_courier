FactoryGirl.define do
  factory :trip do
    destination { Faker::Address.country }
    start_date { Faker::Date.forward(23) }
    end_date { Faker::Date.forward(23) + 23 }
    comment { Faker::Lorem.sentence }
    latitude { rand(55.601152..55.886569) }
    longitude { rand(37.448394..37.819794) }
  end
end
