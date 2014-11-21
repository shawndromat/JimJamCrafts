class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.string :name, null: false, unique: true

      t.timestamps
    end
  end
end
