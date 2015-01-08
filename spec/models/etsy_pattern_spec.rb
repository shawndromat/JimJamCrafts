require 'rails_helper'

RSpec.describe EtsyPattern, :type => :model do
  subject(:etsy_pattern) do 
    EtsyPattern.new(
      listing_id: 94102,
      image_url: "placeholder"
    )
  end
  
  it "is invalid without a listing id" do
    expect(etsy_pattern).to be_valid

    etsy_pattern.listing_id = nil
    expect(etsy_pattern).to_not be_valid
  end

  it "is invalid without an image_url" do
    expect(etsy_pattern).to be_valid

    etsy_pattern.image_url = nil
    expect(etsy_pattern).to_not be_valid
  end

  it { should have_one(:pattern) }
end
