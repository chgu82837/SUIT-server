class RemoveType < ActiveRecord::Migration
  def change
    remove_column :clothing_fields, :type
  end
end
