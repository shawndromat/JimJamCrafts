require 'rails_helper'
require 'etsy_decorator'

RSpec.describe EtsyDecorator, :type => :model do
  let(:etsy_pattern) { create(:etsy_pattern) }
  let(:path) { "v2/listings/#{etsy_pattern.listing_id}/images" }
  subject(:etsy_decorator) do 
    EtsyDecorator.new(etsy_pattern, path)
  end

  it "takes in an etsy pattern correctly" do
    expect(etsy_decorator.etsy_pattern).to eq(etsy_pattern)
  end

  it "takes in a path correctly" do
    expect(etsy_decorator.path).to eq(path)
  end

  describe "#update_image_url" do
    before(:each) { etsy_decorator.update_image_url }

    it "updates the etsy pattern's image url" do
      expect(etsy_pattern.image_url).to_not be_nil
    end

    it "makes the etsy pattern valid" do
      expect(etsy_pattern).to be_valid
    end
  end

  describe "#save" do
    it "calls save on the etsy pattern" do
      allow(etsy_pattern).to receive(:save)

      expect(etsy_pattern).to receive(:save)
      etsy_decorator.save
    end
  end
end
