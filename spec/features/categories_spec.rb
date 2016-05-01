require 'rails_helper'

describe 'Categories', type: :feature do
  scenario "j'accède à la page de présentation des catégories" do
    visit categories_path
    expect(page).to have_http_status(200)
  end
end