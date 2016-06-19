class AddMerchantToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :merchant, index: true, foreign_key: true
  end
end
