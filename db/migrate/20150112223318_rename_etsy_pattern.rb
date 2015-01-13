class RenameEtsyPattern < ActiveRecord::Migration
  def up
    rename_table :etsy_patterns, :etsy_contents
  end

  def down
    rename_table :etsy_contents, :etsy_patterns
  end
end
