class AddListingImageUrlToPatterns < ActiveRecord::Migration
  def change
    add_column :patterns, :image_url, :string, null: false, default: ""
  end
end
