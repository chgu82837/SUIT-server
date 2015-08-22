class AddDefaultValue < ActiveRecord::Migration
  def change
    change_column :clothing_attrs, :value, :string, default: ''
    change_column :clothing_fields, :func, :string, default: 'none'
    change_column :clothings, :chosen, :integer, :default => 0
    change_column :clothings, :recommended, :integer, :default => 0
    change_column :user_choises, :liked, :integer, :default => 0
    change_column :wardrobes, :chosen, :integer, :default => 0
    change_column :wardrobes, :recommended, :integer, :default => 0

    add_column :users, :gender, :string
  end
end
