namespace :update do
  desc "met à jour les categories"
  task :categories => [:environment] do
    Category.all.each do |category|
      if category.parent_id.present?
        category.parent_id = category.parent_id + 1
        category.save
      end
    end
  end
end
