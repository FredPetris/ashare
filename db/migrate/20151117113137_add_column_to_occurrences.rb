class AddColumnToOccurrences < ActiveRecord::Migration
  def change
    add_column :occurrences, :closed, :boolean
  end
end
