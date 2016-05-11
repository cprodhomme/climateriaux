require 'rails_helper'

describe 'Categories', type: :feature do
  scenario "j'accède à la page de la catégorie Peinture et Colles" do
    category = create :category, name: 'Peinture et Colles', slug: 'peinture-colles'
    visit category_path('peinture-colles')
    expect(page).to have_http_status(200)
  end
end