require 'rails_helper'

describe 'admin/merchant', type: :feature do

  context "en tant qu'Admin" do
    let!(:user) { create :user, email: "admin@climateriaux.fr", role: "Admin" }

    before :each do
      create_user_and_log_in user
    end

    scenario "je peux voir tous les marchands" do
      merchant_1 = create :merchant, name: "mon marchand 1"
      merchant_2 = create :merchant, name: "mon marchand 2"
      visit admin_merchants_path
      expect(page).to have_content "mon marchand 1"
      expect(page).to have_content "mon marchand 2"
    end

    scenario "je peux ajouter un nouveau marchand" do
      visit new_admin_merchant_path
      fill_in :merchant_name, with: "mon nouveau marchand"
      fill_in :merchant_description, with: "password"
      click_button "Enregistrer"
      expect(page).to have_content "mon nouveau marchand"
    end

    scenario "je peux editer un marchand" do
      merchant_1 = create :merchant, name: "mon marchand"
      visit edit_admin_merchant_path(merchant_1.id)
      fill_in :merchant_name, with: "mon marchand modife"
      click_button "Enregistrer"
      expect(page).to have_content "mon marchand modife"
    end

    scenario "je peux supprimer un marchand" do
      merchant_1 = create :merchant, name: "mon marchand"
      visit admin_merchants_path
      page.find("#delete-merchant-#{merchant_1.id}").click
      expect(page).to_not have_content "mon marchand"
    end
  end

end