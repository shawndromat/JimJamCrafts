require 'rails_helper'

RSpec.describe Pattern, :type => :model do
  let(:content) { create(:etsy_content) }
  subject(:pattern) do 
    Pattern.new(
      name: "Totoro",
      content: content
    )
  end
  
  it "is invalid without a name" do
    expect(pattern).to be_valid

    pattern.name = nil
    expect(pattern).to_not be_valid
  end

  it "cannot have a repeat name" do
    repeat_pattern = pattern.dup
    repeat_pattern.name = repeat_pattern.name.upcase
    repeat_pattern.save
    expect(pattern).to_not be_valid
  end

  it { should belong_to(:content) }
end
