class CreateTechnicalDetails < ActiveRecord::Migration
  def change
    create_table :technical_details do |t|
      t.references :product, index: true, foreign_key: true
      t.string     :title
      t.text       :detail

      t.timestamps null: false
    end
  end
end
