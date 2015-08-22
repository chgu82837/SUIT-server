class CreateUserModels < ActiveRecord::Migration
  def change
    create_table :user_models do |t|
      t.integer :user_id
      t.integer :tops_type
      t.integer :tops_style
      t.integer :tops_color
      t.integer :bottoms_type
      t.integer :bottoms_style
      t.integer :bottoms_color
      t.integer :priority

      t.timestamps null: false
    end
  end
end
