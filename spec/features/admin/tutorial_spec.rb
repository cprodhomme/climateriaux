require 'rails_helper'

describe 'admin/tutorial', type: :feature do

  context "en tant qu'Admin" do
    let!(:user) { create :user, email: "admin@climateriaux.fr", role: "Admin" }

    before :each do
      create_user_and_log_in user
    end

    scenario "je peux voir tous les tutoriels" do
      merchant = create :user, role: "Merchant"
      tutorial_merchant = create :tutorial, title: "tuto merchant", user_id: merchant
      tutorial_admin = create :tutorial, title: "tuto admin", user_id: user
      visit admin_tutorials_path
      expect(page).to have_content "tuto admin"
      expect(page).to have_content "tuto merchant"
    end

    scenario "je peux supprimer un tutoriel" do
      tutorial = create :tutorial, title: "tuto a supprimer", user_id: user
      visit admin_tutorials_path
      page.find("#delete-tutorial-#{tutorial.id}").click
      expect(page).to_not have_content "tuto a supprimer"
    end

    xscenario "je peux ajouter un nouveau tutoriel" do
      visit new_admin_tutorial_path
      fill_in :tutorial_title, with: "Mon nouveau tutoriel"
      fill_in :tutorial_content, with: "description de mon tuto"
      fill_in :tutorial_resume, with: "le resumé"
      click_button "Enregistrer"
      expect(page).to have_content "Mon nouveau tutoriel"
    end
  end

  context "en tant que Merchant" do
    let!(:user) { create :user, email: "merchant@climateriaux.fr", role: "Merchant" }

    before :each do
      create_user_and_log_in user
    end

    scenario "je peux voir mes tutoriels" do
      admin = create :user, role: "Admin"
      tutorial_admin = create :tutorial, title: "tuto admin", user: admin
      tutorial_merchant = create :tutorial, title: "tuto merchant", user: user
      visit admin_tutorials_path
      expect(page).to have_content "tuto merchant"
      expect(page).to_not have_content "tuto admin"
    end
  end
end