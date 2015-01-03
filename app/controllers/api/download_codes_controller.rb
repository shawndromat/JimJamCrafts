class Api::DownloadCodesController < ApplicationController
  before_action :require_admin, except: [:show]

  def index
    @download_codes = DownloadCode.all
  end

  def create
    @download_code = DownloadCode.new(code_params)
    if @download_code.save
      render json: @download_code
    else
      render json: @download_code.errors.full_messages
    end
  end

  def update
    if download_code.update(code_params)
      render json: download_code
    else
      render json: download_code
    end
  end

  def destroy
    download_code.destroy
  end

  def search
    @download_code = DownloadCode.find_by(code: params[:code])
    render @download_code
  end

  def show
    @download_code = DownloadCode.includes(pattern: :pattern_files)
                                  .find(params[:id])
    render @download_code
  end

  private
  def download_code
    @_download_code = DownloadCode.find(params[:id])
  end

  def code_params
    params.require(:download_code).permit(:pattern_id, :order_number)
  end
end
