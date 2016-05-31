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