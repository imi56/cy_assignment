class CreateItemPromotions < ActiveRecord::Migration[6.0]
  def change
    create_table :item_promotions do |t|
      t.references :item, null: false, foreign_key: true
      t.references :promotion, null: false, foreign_key: true
    end
  end
end
