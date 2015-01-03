class AddOrderNumberToDownloadCode < ActiveRecord::Migration
  def change
    add_column :download_codes, :order_number, :integer, null: false, index: true
  end
end
