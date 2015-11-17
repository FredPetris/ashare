class AddColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :phone_number, :string
    add_column :events, :city, :string
  end
end
