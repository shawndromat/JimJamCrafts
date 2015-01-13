require 'rails_helper'

RSpec.describe PatternBuilder do
  let(:params) do 
    { 
      pattern: {
        name: "My Pattern",
        etsy_pattern: {
          listing_id: 12345667
        }
      }
    }
  end

  subject(:pattern_builder) { PatternBuilder.new(params) }

  describe "#pattern" do 
    let(:pattern) { pattern_builder.pattern }

    it "returns a pattern" do
      expect(pattern_builder.pattern).to be_a(Pattern)
    end

    it "sets up the pattern params correctly" do
      expect(pattern.name).to eq("My Pattern")
    end

    it "sets up the pattern content params correctly" do
      expect(pattern.content.listing_id).to eq(12345667)
    end
  end
end
