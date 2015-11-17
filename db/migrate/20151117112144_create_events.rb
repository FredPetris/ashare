class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :label
      t.text :description
      t.text :address
      t.references :user, index: true, foreign_key: true
      t.integer :number
      t.string :category
      t.float :participation

      t.timestamps null: false
    end
  end
end
