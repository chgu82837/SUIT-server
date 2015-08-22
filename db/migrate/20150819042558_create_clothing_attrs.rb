class CreateClothingAttrs < ActiveRecord::Migration
  def change
    create_table :clothing_attrs do |t|
      t.integer :clothing_field_id
      t.string :value

      t.timestamps null: false
    end
  end
end
