class CreateUserChoises < ActiveRecord::Migration
  def change
    create_table :user_choises do |t|
      t.integer :user_id
      t.integer :clothing_id
      t.integer :liked
      t.datetime :time

      t.timestamps null: false
    end
  end
end
