require 'rails_helper'
require 'etsy_pattern_presenter'

RSpec.describe EtsyPatternPresenter, :type => :model do
  let(:etsy_content) { create(:etsy_content) }
  let(:pattern) { create(:pattern) }
  let(:path) { "v2/listings/:listing_id/images" }
  subject(:etsy_presenter) do 
    EtsyPatternPresenter.new(etsy_content, pattern)
  end

  it "takes in an etsy content correctly" do
    expect(etsy_presenter.etsy_content).to eq(etsy_content)
  end

  it "takes in a pattern correctly" do
    expect(etsy_presenter.pattern).to eq(pattern)
  end

end
