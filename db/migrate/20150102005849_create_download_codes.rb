class CreateDownloadCodes < ActiveRecord::Migration
  def change
    create_table :download_codes do |t|
      t.string :code, null: false, unique: true
      t.integer :pattern_id, null: false, index: true
      t.timestamps
    end
  end
end
