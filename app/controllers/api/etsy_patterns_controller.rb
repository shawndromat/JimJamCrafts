class Api::EtsyPatternsController < ApplicationController
  before_action :require_admin

  def create
    etsy_pattern = EtsyPattern.new(etsy_pattern_params)
    @pattern = Pattern.new(pattern_params)
    @pattern.content = etsy_pattern
    if @pattern.save
      render @pattern
    else
      render json: @pattern.errors.full_messages
    end
  end

  private
  def etsy_pattern_params
    params.require(:pattern).permit(:listing_id)
  end

  def pattern_params
    params.require(:pattern).permit(:name)
  end
end
