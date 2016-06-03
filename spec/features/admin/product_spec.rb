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
  end
end