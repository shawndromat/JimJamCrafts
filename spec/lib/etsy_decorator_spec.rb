require 'rails_helper'
require 'etsy_decorator'

RSpec.describe EtsyDecorator, :type => :model do
  let(:etsy_content) { build(:etsy_content) }

  subject(:etsy_decorator) do 
    EtsyDecorator.new(etsy_content)
  end

  it "takes in an etsy pattern correctly" do
    expect(etsy_decorator.etsy_content).to eq(etsy_content)
  end

  describe "#decorate" do
    before(:each) do
      etsy_content.listing_id = 218515643 
      etsy_decorator.decorate
    end

    context "when the etsy content is new" do
      it "updates the etsy content's image_url" do
        expect(etsy_content.image_url).to_not be_nil
      end
    end

    context "when the etsy content is saved and unchanged" do
      it "does not change the image url" do
        old_url = etsy_content.image_url
        etsy_content.save
        etsy_decorator.decorate
        expect(etsy_content.image_url).to eq(old_url)
      end
    end
  end
end
