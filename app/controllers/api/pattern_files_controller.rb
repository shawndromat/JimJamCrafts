class Api::PatternFilesController < ApplicationController
# class PatternFilesController < ApplicationController
  def create
    @pattern_file = PatternFile.new(pattern_file_params)
    if @pattern_file.save
      render json: @pattern_file
      # redirect_to @pattern_file.pattern
    else
      # flash.now[:errors] << @pattern_file.errors.full_messages
      render json: @pattern_file.errors.full_message, status: 422
      # redirect_to @pattern_file.pattern
    end
  end

  def show
    @pattern_file = PatternFile.new
    render json: @pattern_file
  end

  private
  def pattern_file_params
    params.require(:pattern_file).permit(:pattern_id, :filepicker_url, 
                                         :filename, :name)
  end
end
