class AddSlugToTutorial < ActiveRecord::Migration
  def change
  	add_column :tutorials, :slug, :string
  end
end
