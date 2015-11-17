class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :label
      t.string :image_url
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
