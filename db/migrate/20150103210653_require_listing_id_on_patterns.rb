class RequireListingIdOnPatterns < ActiveRecord::Migration
  def change
    change_column :patterns, :listing_id, :integer, limit: 8, null: false
  end
end
