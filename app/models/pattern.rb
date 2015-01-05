require 'addressable/uri'

class Pattern < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :listing_id, :image_url, presence: true

  has_many :pattern_files, dependent: :destroy
  has_many :download_codes, dependent: :destroy

  before_validation :fetch_image_url


  private
  def fetch_image_url
    images_url = Addressable::URI.new({
      scheme: "https",
      host: "openapi.etsy.com",
      path: "v2/listings/#{listing_id}/images",
      query: "api_key=#{ENV['ETSY_API_KEY']}"
    })
    results = HTTParty.get(images_url.to_s)
    if results
      self.image_url = results.parsed_response["results"].first["url_170x135"]
    else
      self.image_url = "undefined"
    end
  end
end
