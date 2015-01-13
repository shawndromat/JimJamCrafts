require 'rails_helper'
require 'etsy_decorator'

RSpec.describe EtsyDecorator, :type => :model do
  let(:etsy_content) { build(:etsy_content) }
  let(:path) { "v2/listings/:listing_id/images" }
  subject(:etsy_decorator) do 
    EtsyDecorator.new(etsy_content, path)
  end

  it "takes in an etsy pattern correctly" do
    expect(etsy_decorator.etsy_content).to eq(etsy_content)
  end

  it "inserts etsy pattern values in the path correctly" do
    expected_path = "v2/listings/#{etsy_content.listing_id}/images"
    expect(etsy_decorator.path).to eq(expected_path)
  end
  #
  # describe "#update_image_url" do
  #   before(:each) do
  #     etsy_content.listing_id = 204367440
  #     etsy_decorator.update_image_url
  #   end
  #
  #   it "updates the etsy pattern's image url" do
  #     expect(etsy_content.image_url).to_not be_nil
  #   end
  #
  #   it "makes the etsy pattern valid" do
  #     expect(etsy_content).to be_valid
  #   end
  # end
  #
  describe "#save" do
    before(:each) { allow(etsy_content).to receive(:save) }

    it "calls save on the etsy pattern" do
      expect(etsy_content).to receive(:save)
      etsy_decorator.save
    end

    it "updates the image url of a new etsy content" do
      old_url = etsy_content.image_url
      etsy_decorator.save
      expect(etsy_content.image_url).to_not eql(old_url)
    end
  end
end
