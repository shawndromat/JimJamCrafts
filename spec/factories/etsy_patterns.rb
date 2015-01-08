FactoryGirl.define do
  factory :etsy_pattern do
    listing_id { rand(1000) }
    image_url { "image#{listing_id}" }
  end
end
