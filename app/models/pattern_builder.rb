require 'etsy_decorator'

class PatternBuilder
  def initialize(params)
    @params = params
  end

  def pattern
    @_pattern ||= Pattern.new(params)
  end

  private
  def build_content
    content = EtsyContent.new(EtsyContent.pattern_params(@params))
    EtsyDecorator.new(content)
    content
  end

  def params
    puts @params
    pattern_params = @params[:pattern]
    pattern_params.merge({content: build_content})
  end
end
