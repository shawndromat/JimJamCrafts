class EtsyPattern < ActiveRecord::Base
  validates :listing_id, :image_url, presence: true
  has_one :pattern, as: :content
end
