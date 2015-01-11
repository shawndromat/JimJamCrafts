class AddStatusColumnToDownloadCodes < ActiveRecord::Migration
  def change
    add_column :download_codes, :status, :string, null: false, default: "PENDING"
  end
end
