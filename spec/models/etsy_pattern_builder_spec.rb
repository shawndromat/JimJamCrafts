require 'rails_helper'

RSpec.describe EtsyPatternBuilder do
  let(:params) do 
    ActionController::Parameters.new({ 
      pattern: {
        name: "My Pattern",
        listing_id: "12345667"
      }
    })
  end

  subject(:etsy_pattern_builder) { EtsyPatternBuilder.new(params) }

  describe "#build_content" do 
    let(:etsy_content) { etsy_pattern_builder.build_content }

    it "returns etsy content" do
      expect(etsy_content).to be_a(EtsyContent)
    end

    it "returns valid etsy content" do
      expect(etsy_content).to be_valid
    end
  end
end
