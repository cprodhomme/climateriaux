class AddUserToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :user, index: true, foreign_key: true
    add_column :products, :quantity, :integer
  end
end
