# class Api::PatternsController < ApplicationController
class PatternsController < ApplicationController
  def index
    @patterns = Pattern.all
    respond_to do |format|
      format.json { render json: @patterns }
      format.html { render :index }
    end
  end

  def create
    @pattern = Pattern.new(pattern_params)
    if @pattern.save
      respond_to do |format|
        format.json { render json: @pattern }
        format.html { redirect_to @pattern  }
      end
    else
      respond_to do |format|
        format.json { render json: @pattern.errors.full_messages }
        format.html { 
          flash.now[:errors] << @pattern.errors.full_messages
          render :new
        }
      end
    end
  end

  def show
    @pattern = Pattern.find(params[:id])
    respond_to do |format|
      format.json { render json: @pattern }
      format.html { render :show }
    end
  end

  def update
    if pattern.update(pattern_params)
      respond_to do |format|
        format.json { render json: pattern }
        format.html { redirect_to pattern }
      end
    else
      respond_to do |format|
        format.json { render json: pattern.errors.full_messages }
        format.html { 
          flash.now[:errors] << @pattern.errors.full_messages
          render :edit
        }
      end
    end
  end

  def destroy
    pattern.destroy
    respond_to do |format|
      format.json { render json: pattern }
      format.html { redirect_to root_path }
    end
  end

  private

  def pattern_params
    params.require(:pattern).permit(:name, :etsy_url)
  end

  def pattern
    @_pattern ||= Pattern.includes(:files).find(params[:id])
  end
end
