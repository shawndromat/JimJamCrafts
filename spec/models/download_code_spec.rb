require 'rails_helper'

RSpec.describe DownloadCode, :type => :model do
  let(:pattern) { create(:pattern) }
  subject(:download_code) { DownloadCode.new(pattern_id: pattern.id) }

  it "is invalid without a pattern" do
    expect(download_code).to be_valid

    download_code.pattern = nil
    expect(download_code).to_not be_valid
  end

  it "is invalid without a code" do
    expect(download_code).to be_valid

    download_code.code = nil
    expect(download_code).to_not be_valid
  end

  it "has an auto-generated code" do
    expect(download_code.code).to_not be_nil
  end

  it "should have a unique code" do
    repeat_code = DownloadCode.new(pattern_id: pattern.id)
    repeat_code.code = download_code.code
    repeat_code.save

    expect(download_code).to_not be_valid
  end
end
