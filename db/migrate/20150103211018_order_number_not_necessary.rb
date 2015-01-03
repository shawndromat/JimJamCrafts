class OrderNumberNotNecessary < ActiveRecord::Migration
  def change
    remove_index :download_codes, :order_number
    add_index :download_codes, :order_number
  end
end
