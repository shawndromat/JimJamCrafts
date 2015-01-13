FactoryGirl.define do
  factory :pattern do
    name { Faker::Company.name }
  end

  factory :pattern_with_etsy_content do
    name { Faker::Company.name }
    association :content, factory: :etsy_pattern
  end
end
