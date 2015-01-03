class Pattern < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :listing_id, :image_url

  has_many :pattern_files
  has_many :download_codes

  before_validation :fetch_image_url

  private
  def fetch_image_url
  end
end
