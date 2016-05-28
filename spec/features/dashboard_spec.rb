require 'rails_helper'

describe 'Dashboard', type: :feature, focus: true do

  context "en tant qu'Admin" do
    let!(:user) { create :user, email: "admin@climateriaux.fr", role: "admin" }

    before :each do
      create_user_and_log_in user
    end

    scenario "je peux accède au dashboard du Back-office" do
      visit admin_path
      expect(page).to have_content "Dashboard"
    end
  end

  context "en tant que Merchant" do
    let!(:user) { create :user, email: "merchant@climateriaux.fr", role: "merchant" }

    before :each do
      create_user_and_log_in user
    end

    scenario "je peux accède au dashboard du Back-office" do
      visit admin_path
      expect(page).to have_content "Dashboard"
    end
  end

  context "en tant que Customer" do
    let!(:user) { create :user, email: "customer@climateriaux.fr", role: "customer" }

    before :each do
      create_user_and_log_in user
    end

    scenario "je ne peux pas accéder au Back-office" do
      visit admin_path
      expect(page).to_not have_content "Dashboard"
      expect(page).to have_content "Matériaux de sources vérifiés"
    end
  end

  context "en tant que non connecté" do
    scenario "je ne peux pas accéder au Back-office" do
      visit admin_path
      expect(page).to_not have_content "Dashboard"
      expect(page).to have_content "Log in"
    end
  end
end