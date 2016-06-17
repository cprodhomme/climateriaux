require 'rails_helper'

describe 'admin/product', type: :feature do

  context "en tant qu'Admin" do
    let!(:user) { create :user, email: "admin@climateriaux.fr", role: "Admin" }

    before :each do
      create_user_and_log_in user
    end

    scenario "je peux voir tous les produits" do
      product_1 = create :product, name: "produit 1"
      product_2 = create :product, name: "produit 2"
      visit admin_products_path
      expect(page).to have_content "produit 1"
      expect(page).to have_content "produit 2"
    end

    scenario "je peux supprimer un produit" do
      product_1 = create :product, name: "produit 1"
      visit admin_products_path
      page.find("#delete-product-#{product_1.id}").click
      expect(page).to_not have_content "produit 1"
    end

    scenario "je peux ajouter un produit" do
      visit new_admin_product_path
      fill_in :product_name, with: "Parpaing"
      fill_in :product_slug, with: "parpaing"
      fill_in :product_description, with: "Un stock de parpaing d'un metre cube"
      fill_in :product_marque, with: "parpa"
      fill_in :product_price, with: 75.50
      fill_in :product_quantity, with: 10
      select "oui", :from => "product[active]"
      click_button "Enregistrer"
      expect(page).to have_content "Parpaing"
    end

    scenario "je peux editer un produit" do
      product = create :product, user_id: user
      visit edit_admin_product_path(slug: product.slug)
      fill_in :product_name, with: "Mon nouveau titre"
      click_button "Enregistrer"
      expect(page).to have_content "Mon nouveau titre"
    end
  end
end