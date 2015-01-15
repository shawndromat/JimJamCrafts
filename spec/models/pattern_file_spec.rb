require 'rails_helper'

RSpec.describe PatternFile, :type => :model do
  let(:pattern) { create(:pattern) }
  subject(:file) { PatternFile.new(name: "Totoro Instructions", pattern_id: pattern.id) }

  it "is invalid without a name" do
    expect(file).to be_valid

    file.name = nil
    expect(file).to_not be_valid
  end

  it "is invalid without a pattern" do
    expect(file).to be_valid

    file.pattern = nil
    expect(file).to_not be_valid
  end
end
