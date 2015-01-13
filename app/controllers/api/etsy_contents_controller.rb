class Api::EtsyContentsController < ApplicationController
  before_action :require_admin

  def create
    etsy_content = EtsyPattern.new(etsy_content_params)
    pattern = Pattern.new(pattern_params)


    if etsy_decorator.update_image_url
      render pattern
    else
      render json: pattern.errors.full_messages
    end
  end

  private
  def etsy_content_params
    params.require(:pattern).permit(:listing_id)
  end

  def pattern_params
    params.require(:pattern).permit(:name)
  end
end
