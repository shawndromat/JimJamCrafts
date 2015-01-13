FactoryGirl.define do
  factory :etsy_content do
    listing_id { rand(100000000..220000000)}
    image_url { "image#{listing_id}" }
  end
end
