class RemoveOldPatternColumns < ActiveRecord::Migration
  def up
    revert do 
      add_column :patterns, :listing_id, :integer, null: false, limit: 8
      add_column :patterns, :image_url, :string, null: false
    end

    change_column :patterns, :content_id, :integer, null: false
    change_column :patterns, :content_type, :string, null: false
  end

  def down
    add_column :patterns, :listing_id, :integer, null: false, limit: 8
    add_column :patterns, :image_url, :string, null: false
    execute "ALTER TABLE 'patterns' ALTER COLUMN 'content_id' DROP NOT NULL"
    execute "ALTER TABLE 'patterns' ALTER COLUMN 'content_type' DROP NOT NULL"
  end
end
