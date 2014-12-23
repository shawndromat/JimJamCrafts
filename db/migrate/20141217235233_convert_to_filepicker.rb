class ConvertToFilepicker < ActiveRecord::Migration
  def change
    remove_attachment :pattern_files, :content
    add_column :pattern_files, :filepicker_url, :string
  end
end
