require 'rails_helper'

RSpec.describe Pattern, :type => :model do
  
  subject(:pattern) { Pattern.new(name: "Totoro") }

  it "is invalid without a name" do
    expect(pattern).to be_valid

    pattern.name = nil
    expect(pattern).to_not be_valid
  end

  it "cannot have a repeat name" do
    repeat_pattern = pattern.dup
    repeat_pattern.save
    expect(pattern).to_not be_valid
  end
end
