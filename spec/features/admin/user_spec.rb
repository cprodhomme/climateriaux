require 'rails_helper'

describe 'admin/user', type: :feature do

  context "en tant qu'Admin" do
    let!(:user) { create :user, email: "admin@climateriaux.fr", role: "admin" }

    before :each do
      create_user_and_log_in user
    end

    scenario "je peux voir tous les utilisateurs" do
      user_1 = create :user, email: "user1@exemple.fr"
      user_2 = create :user, email: "user2@exemple.fr"
      visit admin_users_path
      expect(page).to have_content "user1@exemple.fr"
      expect(page).to have_content "user2@exemple.fr"
    end

    scenario "je peux ajouter un nouvel utilisateur" do
      visit new_admin_user_path
      fill_in :user_email, with: "nouvel@utilisateur.fr"
      fill_in :user_password, with: "password"
      fill_in :user_password_confirmation, with: "password"
      click_button "Enregistrer"
      expect(page).to have_content "nouvel@utilisateur.fr"
    end

    scenario "je peux editer un utilisateur" do
      user_1 = create :user, email: "user1@exemple.fr"
      visit edit_admin_user_path(user_1.id)
      fill_in :user_email, with: "nouvel@email.fr"
      click_button "Enregistrer"
      expect(page).to have_content "nouvel@email.fr"
    end

    scenario "je peux supprimer un utilisateur" do
      user_1 = create :user, email: "user1@exemple.fr"
      visit admin_users_path
      page.find("#delete-user-#{user_1.id}").click
      expect(page).to_not have_content "user1@exemple.fr"
    end
  end
end