class RemoveDefaultImageUrl2 < ActiveRecord::Migration
  def change
    change_column_default(:patterns, :image_url, nil)
  end
end
