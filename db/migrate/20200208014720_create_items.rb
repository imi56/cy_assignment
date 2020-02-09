class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true, unique: true
      t.decimal :price, null: false
    end
  end
end
