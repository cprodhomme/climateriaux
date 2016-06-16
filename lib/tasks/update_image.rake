namespace :update do
  desc "met à jour les images des produits"
  task :product_image => [:environment] do
    ProductImage.all.each do |product|
      product.image.recreate_versions!
    end
  end

  desc "met à jour les logos des marchands"
  task :merchant_logo => [:environment] do
    Merchant.all.each do |m|
      m.logo.recreate_versions!
    end
  end
end
