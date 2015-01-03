class AddListingIdToPattern < ActiveRecord::Migration
  def change
    add_column :patterns, :listing_id, :integer, limit: 8
    remove_column :patterns, :etsy_url
  end
end
