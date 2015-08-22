class CreateWardrobes < ActiveRecord::Migration
  def change
    create_table :wardrobes do |t|
      t.integer :clothing_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
