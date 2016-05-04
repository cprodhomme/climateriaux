FactoryGirl.define do
  factory :product do
    name "Mon produit"
    description "MyText"
    slug "mon-produit"
    price "9.99"
    active false
    category nil
  end
end
