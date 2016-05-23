# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

require 'json'

technical_details_data = [
  {
    title: "Composition",
    detail: "Liège expansé pur 100 %",
    product_id: 1
  },
  {
    title: "Provenance",
    detail: "Issu du chêne liège, récolté tous les septs ans. Produit non renouvelable.",
    product_id: 1
  },
  {
    title: "Dimensions",
    detail: "1 m x 0,50 m<br>Existe en épaisseurs : 10-20-30-40-50-60-80-100-120-150 ",
    product_id: 1
  },
  {
    title: "Conductivité thermique",
    detail: "0,037 à 0,04 w / m°C",
    product_id: 1
  },
  {
    title: "Capacité thermique",
    detail: "1670 J / kg°K",
    product_id: 1
  },
  {
    title: "Densité",
    detail: "105 kg / m3",
    product_id: 1
  },
  {
    title: "Classement au feu",
    detail: "E",
    product_id: 1
  },
  {
    title: "Affaiblissement accoustique",
    detail: "Jusqu’à 34 dB selon la mise en oeuvre",
    product_id: 1
  }
]

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
  TechnicalDetail.create!(technical_details_data)

  logo_merchant = Rails.root.join("app/assets/images/logo_merchant.png").open
  merchant = Merchant.create! id: 1, name: "Smartagro", description: "Je suis un marchant de test", logo: logo_merchant
  ProductMerchant.create! id: 1, product: product, merchant: merchant, stock: 3
end