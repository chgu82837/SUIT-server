class CreateClothingFields < ActiveRecord::Migration
  def change
    create_table :clothing_fields do |t|
      t.string :name
      t.string :type
      t.string :func

      t.timestamps null: false
    end
  end
end
