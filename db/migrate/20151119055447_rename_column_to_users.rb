class RenameColumnToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :phone_number, :phone
  end
end
