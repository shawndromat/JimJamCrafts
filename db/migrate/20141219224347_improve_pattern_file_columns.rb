class ImprovePatternFileColumns < ActiveRecord::Migration
  def change
    add_column :pattern_files, :filename, :string
  end
end
