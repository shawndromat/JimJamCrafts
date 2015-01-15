class PatternBuilder
  def initialize(params)
    @params = params
  end

  def pattern
    @_pattern ||= Pattern.new(params)
  end

  private

  def params
    pattern_params = @params.require(:pattern).permit(:name)
    pattern_params.merge({content: build_content})
  end
end
