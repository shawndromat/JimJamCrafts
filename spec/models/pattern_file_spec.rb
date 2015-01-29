require 'rails_helper'

RSpec.describe PatternFile, :type => :model do
  let(:pattern) { create(:pattern) }
  subject(:file) { PatternFile.new(name: "Totoro Instructions", pattern_id: pattern.id, filepicker_url: "placeholer", filename: "filename") }

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

  it "is invalid without a file url" do
    expect(file).to be_valid

    file.filepicker_url = nil
    expect(file).to_not be_valid
  end

  it "is invalid without a filename" do
    expect(file).to be_valid

    file.filename = nil
    expect(file).to_not be_valid
  end
end
