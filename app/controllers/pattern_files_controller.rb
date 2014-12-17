# class Api::PatternFilesController < ApplicationController
class PatternFilesController < ApplicationController
  def create
    @pattern_file = PatternFile.new(pattern_file_params)
    if @pattern_file.save
      # render json: @pattern_file
      redirect_to :show
    else
      # render json: @pattern_file.errors.full_message, status: 422
      flash.now[:errors] << @pattern_file.errors.full_messages
    end
  end

  def show
    render pattern_file
  end

  def update
    if pattern_file.update(pattern_file_params)
      redirect_to pattern_file
    else
      flash.now[:errors] << @pattern_file.errors.full_messages
    end
  end

  private
  def pattern_file_params
    params.require(:pattern_file).permit(:pattern_id, :content, :name)
  end

  def pattern_file
    @_pattern_file ||= PatternFile.find(params[:id])
  end
end
