class DeleteTableInventories < ActiveRecord::Migration
  def change
    drop_table :inventories
  end
end
