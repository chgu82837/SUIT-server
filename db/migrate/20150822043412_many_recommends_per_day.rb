class ManyRecommendsPerDay < ActiveRecord::Migration
  def change
    add_column :recommends, :group, :integer
  end
end
