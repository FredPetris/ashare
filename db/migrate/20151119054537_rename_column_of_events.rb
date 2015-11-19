class RenameColumnOfEvents < ActiveRecord::Migration
  def change
    rename_column :events, :number, :place
  end
end
