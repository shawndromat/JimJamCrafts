class Api::PatternsController < ApplicationController
  before_action :require_admin

  def index
    @patterns = Pattern.includes(:pattern_files).all
  end


  def show
    render pattern
  end

  def update
    if pattern.update(pattern_params)
      render json: pattern
    else
      render json: pattern.errors.full_messages
    end
  end

  def destroy
    pattern.destroy
    render json: pattern
  end

  private

  def pattern_params
    params.require(:pattern).permit(:name, :listing_id)
  end

  def pattern
    @_pattern ||= Pattern.find(params[:id])
  end
end
