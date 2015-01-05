class RemoveDefaultImageUrl < ActiveRecord::Migration
  def change
    Pattern.all.each do |pattern|
      pattern.image_url ||= "images/no_image.jpg"
      pattern.save!
    end
    change_column :patterns, :image_url, :string, null: false, default: nil
  end
end
