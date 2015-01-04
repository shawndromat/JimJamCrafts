class OrderNumberReallyNotNecessary < ActiveRecord::Migration
  def change
    change_column :download_codes, :order_number, :integer, limit: 8
  end
end
