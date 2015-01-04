class OrderNumberReallyReallyNotNecessary < ActiveRecord::Migration
  def change
    remove_column :download_codes, :order_number
    add_column :download_codes, :order_number, :integer, limit: 8
  end
end
