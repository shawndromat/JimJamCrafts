class EtsyPattern < ActiveRecord::Base
  validates :listing_id, :image_url, presence: true
  has_one :pattern, as: :content

  private

  def fetch_image_url
    images_url = Addressable::URI.new({
      scheme: "https",
      host: "openapi.etsy.com",
      path: "v2/listings/#{listing_id}/images",
      query: "api_key=#{ENV['ETSY_API_KEY']}"
    })
    results = HTTParty.get(images_url.to_s).parsed_response["results"]
    if results
      self.image_url = results.first["url_170x135"]
    else
      self.image_url = "images/no_image.jpg"
    end
  end
end
