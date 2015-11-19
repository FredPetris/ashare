class RenameColumnFromEvents < ActiveRecord::Migration
  def change
    rename_column :events, :phone_number, :phone
  end
end
