class ChangeDefaultColumnOfRole < ActiveRecord::Migration
  def change
    change_column_default :users, :role, 'Customer'
  end
end
