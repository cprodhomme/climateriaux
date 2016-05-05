class CreateProductMedias < ActiveRecord::Migration
  def change
    create_table :product_medias do |t|
      t.references :product, index: true, foreign_key: true
      t.string     :media
      t.integer    :order
    end
  end
end
