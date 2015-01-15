require 'rails_helper'

RSpec.describe PatternBuilder do
  let(:params) do 
    ActionController::Parameters.new({ 
      pattern: {
        name: "My Pattern",
        listing_id: "12345667"
      }
    })
  end

  subject(:pattern_builder) { PatternBuilder.new(params) }

  describe "#pattern" do 

    it "returns a pattern" do
      expect(pattern_builder.pattern).to be_a(Pattern)
    end

    it "sets up the pattern params correctly" do
      expect(pattern_builder.pattern.name).to eq("My Pattern")
    end

    it "returns a valid pattern" do
      expect(pattern_builder.pattern).to be_valid
    end
  end
end
