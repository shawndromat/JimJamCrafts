class CreatePatternFiles < ActiveRecord::Migration
  def change
    create_table :pattern_files do |t|
      t.attachment :content
      t.string :name, null: false
      t.integer :pattern_id, null: false, index: true

      t.timestamps
    end
  end
end
