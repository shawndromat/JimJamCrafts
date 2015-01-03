class AddUniqueIndices < ActiveRecord::Migration
  def change
    add_index :download_codes, :code, unique: true
    add_index :download_codes, :order_number, unique: true
    add_index :patterns, :name, unique: true
  end
end
