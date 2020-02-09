class RenameColumnTypeToCategoryInPromotions < ActiveRecord::Migration[6.0]
  def change
    rename_column :promotions, :type, :category
  end
end
