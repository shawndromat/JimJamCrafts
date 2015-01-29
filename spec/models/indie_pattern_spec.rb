require 'rails_helper'

RSpec.describe IndieContent, :type => :model do
  subject(:indie_content) do 
    IndieContent.new(
      image_url: "placeholder"
    )
  end
  
  it "is invalid without an image_url" do
    expect(indie_content).to be_valid

    indie_content.image_url = nil
    expect(indie_content).to_not be_valid
  end

  it { should have_one(:pattern) }
end
