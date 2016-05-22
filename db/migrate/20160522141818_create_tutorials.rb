class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.string      :title
      t.text        :description
      t.references  :user, index: true, foreign_key: true
      t.string      :image

      t.timestamps null: false
    end
  end
end
