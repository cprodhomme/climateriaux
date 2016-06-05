class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.references :product, index: true, foreign_key: true
      t.references :merchant, index: true, foreign_key: true
      t.integer :stock
      t.decimal :price, precision: 12, scale: 3

      t.timestamps null: false
    end
  end
end
