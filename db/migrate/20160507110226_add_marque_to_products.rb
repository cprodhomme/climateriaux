class AddMarqueToProducts < ActiveRecord::Migration
  def change
    add_column :products, :marque, :string
  end
end
