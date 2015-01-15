class CreateEtsyPatterns < ActiveRecord::Migration
  def change
    create_table :etsy_patterns do |t|
      t.integer :listing_id, limit: 8, null: false
      t.string :image_url, null: false
    end

    add_column :patterns, :content_id, :integer
    add_column :patterns, :content_type, :string
    add_index :patterns, [:content_id, :content_type]

    Pattern.transaction do
      Pattern.all.each do |pattern|
        etsy_pattern = EtsyPattern.new(
          listing_id: pattern.listing_id,
          image_url: pattern.image_url
        )
        etsy_pattern.save

        pattern.content_id = etsy_pattern.id
        pattern.content_type = "EtsyPattern"
        pattern.save
      end
    end
  end
end
