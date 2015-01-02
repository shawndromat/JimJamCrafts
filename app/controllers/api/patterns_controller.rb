class Api::PatternsController < ApplicationController
  def index
    @patterns = Pattern.all
  end

  def create
    @pattern = Pattern.new(pattern_params)
    if @pattern.save
      render json: @pattern
    else
      render json: @pattern.errors.full_messages
    end
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
    params.require(:pattern).permit(:name, :etsy_url)
  end

  def pattern
    @_pattern ||= Pattern.find(params[:id])
  end
end
