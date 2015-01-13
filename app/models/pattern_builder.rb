class PatternBuilder
  def initialize(params)
    @params = params
  end

  def pattern
    @_pattern ||= Pattern.new(
      name: params[:name], 
      content: build_content
    )
  end

  private
  def build_content
    content = EtsyPattern.new(EtsyPattern.params)
    Etsy
  end
end
