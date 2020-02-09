class CreatePromotions < ActiveRecord::Migration[6.0]
  def change
    create_table :promotions do |t|
      t.string :type, null: false, index: true
      t.hstore :rule, default: {}
      t.boolean :active, default: true
      t.datetime :from
      t.datetime :to
    end
  end
end
