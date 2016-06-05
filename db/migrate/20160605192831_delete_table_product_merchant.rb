class DeleteTableProductMerchant < ActiveRecord::Migration
  def change
    drop_table :product_merchants
  end
end
