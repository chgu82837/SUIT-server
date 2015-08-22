class ForgotToAddClothingAttr2clothing < ActiveRecord::Migration
  def change
    add_column :clothing_attrs, :clothing_id, :integer
  end
end
