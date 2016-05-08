class CreateProductMerchants < ActiveRecord::Migration
  def change
    create_table :product_merchants do |t|
      t.references :product, index: true, foreign_key: true
      t.references :merchant, index: true, foreign_key: true
    end
  end
end
