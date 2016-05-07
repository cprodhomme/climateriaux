# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categoriesData = [
  {
    name: 'Peinture et Colles',
    slug: 'peinture-colles'
  },
  {
    name: 'Finitions décoratives',
    slug: 'finitions-decoratives',
    parent_id: 0
  },
  {
    name: 'Peintures ludiques',
    slug: 'peintures-ludiques',
    parent_id: 0
  },
  {
    name: 'Peintures naturelles',
    slug: 'peintures-naturelles',
    parent_id: 0
  },
  {
    name: 'Enduits',
    slug: 'enduits'
  },
  {
    name: 'Charges et colorants pour enduits',
    slug: 'charges-colorants-pour-enduits',
    parent_id: 4
  },
  {
    name: 'Enduits de finitions',
    slug: 'enduits-de-finitions',
    parent_id: 4
  },
  {
    name: 'Enduits exterieurs',
    slug: 'enduits-exterieurs',
    parent_id: 4
  },
  {
    name: 'Enduits intérieurs',
    slug: 'enduits-interieurs',
    parent_id: 4
  },
  {
    name: 'Gros œuvre',
    slug: 'gros-oeuvre'
  },
  {
    name: 'Briques et blocs',
    slug: 'briques-blocs',
    parent_id: 9
  },
  {
    name: 'Charpentes',
    slug: 'charpentes',
    parent_id: 9
  },
  {
    name: 'Chaux, terres et argiles',
    slug: 'chaux-terres-argiles',
    parent_id: 9
  },
  {
    name: 'Plaques et panneaux',
    slug: 'plaques-panneaux',
    parent_id: 9
  },
  {
    name: 'Préparation des supports',
    slug: 'preparation-des-supports',
    parent_id: 9
  },
  {
    name: 'Isolation',
    slug: 'isolation'
  },
  {
    name: "Isolation à l'humidité",
    slug: 'isolation-humidite',
    parent_id: 15
  },
  {
    name: "Isolation des cloisons",
    slug: 'isolation-cloisons',
    parent_id: 15
  },
  {
    name: "Isolation des combles",
    slug: 'isolation-combles',
    parent_id: 15
  },
  {
    name: "Isolation des murs",
    slug: 'isolation-murs',
    parent_id: 15
  },
  {
    name: "Isolation du sol",
    slug: 'isolation-sol',
    parent_id: 15
  },
  {
    name: "Isolation phonique",
    slug: 'isolation-phonique',
    parent_id: 15
  },
  {
    name: "Portes et fenêtres",
    slug: 'portes-fenetres'
  },
  {
    name: "Fenêtres",
    slug: 'fenetres',
    parent_id: 22
  },
  {
    name: "Portes",
    slug: 'portes',
    parent_id: 22
  },
  {
    name: "Volets",
    slug: 'volets',
    parent_id: 22
  },
  {
    name: "Chauffage",
    slug: 'chauffage'
  },
  {
    name: "Chauffage de l'eau",
    slug: 'chauffage-eau',
    parent_id: 26
  },
  {
    name: "Chauffe-eaux solaires",
    slug: 'chauffe-eaux-solaires',
    parent_id: 26
  },
  {
    name: "Diffusion de chaleur",
    slug: 'diffusion-chaleur',
    parent_id: 26
  },
  {
    name: "Energie renouvelable",
    slug: 'energie-renouvelable',
    parent_id: 26
  },
  {
    name: "Poêles",
    slug: 'poeles',
    parent_id: 26
  },
  {
    name: "Pompes à chaleur",
    slug: 'pompes-chaleur',
    parent_id: 26
  },
  {
    name: "Renouvellement de l'air",
    slug: 'Renouvellement-air',
    parent_id: 26
  },
  {
    name: "Production d'énergie verte",
    slug: 'production-energie-verte'
  },
  {
    name: "Batteries",
    slug: 'batteries',
    parent_id: 34
  },
  {
    name: "Eoliennes domestiques",
    slug: 'eoliennes-domestiques',
    parent_id: 34
  },
  {
    name: "Onduleurs",
    slug: 'onduleurs',
    parent_id: 34
  },
  {
    name: "Panneaux solaires photovoltaïques",
    slug: 'panneaux-solaires-photovoltaiques',
    parent_id: 34
  },
  {
    name: "Régulateurs",
    slug: 'regulateurs',
    parent_id: 34
  },
  {
    name: "Système d'économie d'énergie",
    slug: 'systeme-economie-energie'
  },
  {
    name: "Ampoules basse consommation",
    slug: 'ampoules-basse-consommation',
    parent_id: 40
  },
  {
    name: "Programmateur de chauffe",
    slug: 'programmateur-chauffe',
    parent_id: 40
  },
  {
    name: "Programmateurs d'éclairage",
    slug: 'programmateur-eclairage',
    parent_id: 40
  },
  {
    name: "Thermostats",
    slug: 'thermostats',
    parent_id: 40
  },
  {
    name: "Pour le bois",
    slug: 'bois'
  },
  {
    name: "Colles et joints",
    slug: 'colles-joints',
    parent_id: 45
  },
  {
    name: "Diluants",
    slug: 'diluants',
    parent_id: 45
  },
  {
    name: "Huiles et cires protectrices",
    slug: 'huiles-cires-protectrices',
    parent_id: 45
  },
  {
    name: "Préparation et protection des supports",
    slug: 'preparation-protection-supports',
    parent_id: 45
  },
  {
    name: "Produits pour le bois",
    slug: 'produits-bois',
    parent_id: 45
  }
]

if Category.count == 0 
  categories = []
  categories << Category.create!(categoriesData)
end

if OrderStatus.count == 0
  OrderStatus.create! id: 1, name: "In Progress"
  OrderStatus.create! id: 2, name: "Placed"
  OrderStatus.create! id: 3, name: "Shipped"
  OrderStatus.create! id: 4, name: "Cancelled"
end

image_product = Rails.root.join("app/assets/images/image_produit.png").open

if Product.count == 0
  product = Product.create! id: 1, name: "Rouleau de liège naturel", price: 5.49, active: true, category_id: 1, slug: "rouleau-de-liege-naturel"
  ProductImage.create! id: 1, product: product, image: image_product, order: 0
end