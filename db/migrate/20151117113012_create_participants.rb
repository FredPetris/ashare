class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.references :user, index: true, foreign_key: true
      t.references :occurrence, index: true, foreign_key: true
      t.string :label
      t.text :content
      t.integer :rating

      t.timestamps null: false
    end
  end
end
