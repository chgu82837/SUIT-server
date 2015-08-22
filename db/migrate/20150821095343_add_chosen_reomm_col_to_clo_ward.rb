class AddChosenReommColToCloWard < ActiveRecord::Migration
  def change
    add_column :clothings, :chosen, :integer
    add_column :clothings, :recommended, :integer

    add_column :wardrobes, :chosen, :integer
    add_column :wardrobes, :recommended, :integer
  end
end
