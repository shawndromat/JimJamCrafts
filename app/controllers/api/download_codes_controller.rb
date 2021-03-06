class Api::DownloadCodesController < ApplicationController
  before_action :require_admin, except: [:show, :search]

  def index
    if params[:query]
      @download_codes = DownloadCode.where("status = ?", params[:query].upcase)
    else
      @download_codes = DownloadCode.includes(:pattern).all
    end
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
    @download_code = DownloadCode.find_by(code: params[:code].downcase)
    if @download_code
      render @download_code
    else
      render text: "Code not found", status: 404
    end
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
    params.require(:download_code).permit(:id, :pattern_id, :order_number, :status, :code)
  end
end
