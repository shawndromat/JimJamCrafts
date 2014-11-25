class AddEtsyUrlToPattern < ActiveRecord::Migration
  def change
    add_column :patterns, :etsy_url, :string
  end
end
