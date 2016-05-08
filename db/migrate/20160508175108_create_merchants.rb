class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string    :name
      t.text      :description
      t.string    :logo

      t.timestamps null: false
    end
  end
end
