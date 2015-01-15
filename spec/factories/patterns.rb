FactoryGirl.define do
  factory :pattern do
    name { Faker::Company.name }
    content_id 1
    content_type "EtsyContent"
  end

  factory :pattern_with_etsy_content, class: Pattern do
    name { Faker::Company.name }
    content_id 1
    content_type "EtsyContent"
    association :content, factory: :etsy_content, strategy: :create
  end

end
