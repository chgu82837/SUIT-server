class CreateRecommends < ActiveRecord::Migration
  def change
    create_table :recommends do |t|
      t.integer :user_id
      t.integer :clothing_id
      t.date :day

      t.timestamps null: false
    end
  end
end
