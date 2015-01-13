class EtsyContent < ActiveRecord::Base
  validates :listing_id, :image_url, presence: true
  has_one :pattern, as: :content

  def self.pattern_params(params)
    # params.require(:etsy_content).permit(:listing_id)
    params[:etsy_content]
  end
end
