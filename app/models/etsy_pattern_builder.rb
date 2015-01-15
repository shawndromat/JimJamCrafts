require 'etsy_decorator'

class EtsyPatternBuilder < PatternBuilder

  #TODO: I don't love that these methods are public.
  #I wanted this separate class to have these methods be public and 
  #testable but the ultimate api for these PatternBuilder classes
  #should be smaller than this

  def build_content
    content = EtsyContent.new(content_params)
    EtsyDecorator.new(content).decorate
    content
  end

  def content_params
    @params.require(:pattern).permit(:listing_id)
  end
end
