# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

require 'json'

if Category.count == 0
  categories = []
  categoriesJSON = ActiveSupport::JSON.decode(File.read('db/seeds/categories.json'))
  categoriesJSON.each do |c|
    if c['parent_id']
      categories << Category.create!(name: c['name'], slug: c['slug'], parent_id: c['parent_id'])
    else
      categories << Category.create!(name: c['name'], slug: c['slug'])
    end
  end
end

if OrderStatus.count == 0
  OrderStatus.create! id: 1, name: "In Progress"
  OrderStatus.create! id: 2, name: "Placed"
  OrderStatus.create! id: 3, name: "Shipped"
  OrderStatus.create! id: 4, name: "Cancelled"
end

image_product = Rails.root.join("app/assets/images/image_produit.png").open

if Product.count == 0
  product = Product.create! id: 1, name: "Rouleau de liège naturel", price: 5.49, active: true, category_id: 1, slug: "rouleau-de-liege-naturel", marque: "ISOCOR", description: "Liège naturel expansé pur conditionné en panneau rigide. Isolant thermique et phonique, le liège est obtenu à partir du chêne liège, réduit en granulés puis expansé à la vapeur. L'énergie, nécessaire à l'expansion du liège est issue à 95% de la biomasse et 5 % de l’électricité. Particulièrement adapté au milieu humide, le liège est imputrescible, résistant à l'écrasement, absorbant acoustique et auto extinguible. Durable, le liège conserve ses caractéristiques longtemps et il n'est pas attaqué par les insectes."
  ProductImage.create! id: 1, product: product, image: image_product, order: 0
  
  technical_detailsJSON = ActiveSupport::JSON.decode(File.read('db/seeds/technical_details.json'))
  technical_detailsJSON.each do |td|
    TechnicalDetail.create!(title: td['title'], detail: td['detail'], product_id: td['product_id'])
  end

  logo_merchant = Rails.root.join("app/assets/images/logo_merchant.png").open
  merchant = Merchant.create! id: 1, name: "Smartagro", description: "Je suis un marchant de test", logo: logo_merchant
  ProductMerchant.create! id: 1, product: product, merchant: merchant, stock: 3
end

if Tutorial.count == 0
  tutorialsJSON = ActiveSupport::JSON.decode(File.read('db/seeds/tutorials.json'))
  tutorialsJSON.each do |t|
    $i = 0
    $num = 8

    while $i < $num do
      Tutorial.create!(title: t['title'], resume: t['resume'], content: t['content'], slug: $i)
      $i +=1
    end
  end
end

if Rails.env.development?
  if User.count == 0
    User.create(email: 'admin@climateriaux.fr', password: 'password', role: 'Admin')
  end
end