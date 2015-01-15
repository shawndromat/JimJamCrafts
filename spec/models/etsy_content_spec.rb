require 'rails_helper'

RSpec.describe EtsyContent, :type => :model do
  subject(:etsy_content) do 
    EtsyContent.new(
      listing_id: 94102,
      image_url: "placeholder"
    )
  end
  
  it "is invalid without a listing id" do
    expect(etsy_content).to be_valid

    etsy_content.listing_id = nil
    expect(etsy_content).to_not be_valid
  end

  it "is invalid without an image_url" do
    expect(etsy_content).to be_valid

    etsy_content.image_url = nil
    expect(etsy_content).to_not be_valid
  end

  it { should have_one(:pattern) }
end
