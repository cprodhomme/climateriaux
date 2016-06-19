FactoryGirl.define do
  factory :product do
    name "Mon produit"
    description "MyText"
    slug "mon-produit"
    price "9.99"
    quantity 10
    active true
    category
    merchant
  end
end
