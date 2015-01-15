class Api::EtsyPatternsController < ApplicationController
  wrap_parameters :pattern

  before_action :require_admin

  def create
    etsy_pattern = EtsyPatternBuilder.new(params).pattern

    if etsy_pattern.save
      render etsy_pattern
    else
      render json: etsy_pattern.errors.full_messages
    end
  end
end
