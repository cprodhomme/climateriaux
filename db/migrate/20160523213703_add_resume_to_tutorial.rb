class AddResumeToTutorial < ActiveRecord::Migration
  def change
  	add_column :tutorials, :resume, :string
  end
end
